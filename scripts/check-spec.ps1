#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Validate specification-gate metadata for spec-gated-architecture-lifecycle.

.DESCRIPTION
    Enforces the core rule "only APPROVED specifications are implementable" in a
    machine-checkable way. Reads spec files and checks their status metadata.

    Status is read from either:
      - YAML frontmatter  (status: APPROVED)
      - a Markdown metadata table row:  | Status | `APPROVED` |

    Checks:
      1. A spec has a recognizable Status value.
      2. Status is within the allowed set.
      3. An implementable status (APPROVED/IMPLEMENTING/VALIDATED) has Acceptance
         Criteria (AC-<n> entries).
      4. (default) An implementable status also has an explicit Scope (In/Out)
         and a Test Plan or Traceability mapping; disable with -SkipCompleteness.
      5. (optional) With -RequireApproved, status must be APPROVED/IMPLEMENTING/VALIDATED.
      6. (optional) With -EnforceGate, IMPLEMENTING/VALIDATED specs must have a
         delivery review containing the spec's ID with Gate state PASSED or
         PASSED_WITH_RISKS.

    Only files whose spec ID matches SPEC-<word>-<n> are treated as specs;
    delivery reviews (REV-<type>-<n>), registers, and governance docs are skipped.

.PARAMETER Path
    A spec .md file or a directory to scan recursively.

.PARAMETER RequireApproved
    Fail if any scanned spec is not APPROVED/IMPLEMENTING/VALIDATED.

.PARAMETER EnforceGate
    Fail if an IMPLEMENTING/VALIDATED spec has no passing delivery review for its spec ID.

.PARAMETER SkipCompleteness
    Skip the Scope and Test Plan/Traceability completeness checks.

.PARAMETER AllowStatus
    Override the allowed status set.

.EXAMPLE
    .\check-spec.ps1 -Path .\specs -RequireApproved
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [switch]$RequireApproved,
    [switch]$EnforceGate,
    [switch]$SkipCompleteness,
    [string[]]$AllowStatus
)

$ErrorActionPreference = "Stop"

$AllStatuses        = @('DRAFT', 'IN_REVIEW', 'APPROVED', 'IMPLEMENTING', 'VALIDATED', 'DEPRECATED', 'REJECTED')
$Implementable      = @('APPROVED', 'IMPLEMENTING', 'VALIDATED')
$Approvedish        = @('APPROVED', 'IMPLEMENTING', 'VALIDATED')
$allowed            = if ($AllowStatus) { $AllowStatus } else { $AllStatuses }
$GatePassing        = @('PASSED', 'PASSED_WITH_RISKS')

function Get-SpecMeta {
    param([string]$File)

    $text = Get-Content -LiteralPath $File -Raw -Encoding UTF8
    if ($null -eq $text) { $text = "" }
    $status = $null
    $id = $null

    # 1) YAML frontmatter
    if ($text -match '(?s)^\s*---\s*\r?\n(.*?)\r?\n---') {
        $fm = $Matches[1]
        foreach ($line in ($fm -split "\r?\n")) {
            if ($line -match '^\s*(?i)status\s*:\s*(.+?)\s*$') {
                $status = ($Matches[1] -replace '^[`"'']+', '' -replace '[`"'']+$', '').Trim()
            }
            if (-not $id -and $line -match '^\s*(?i)(id|spec[_-]?id|document[ _-]?id)\s*:\s*(.+?)\s*$') {
                $id = ($Matches[2]).Trim()
            }
        }
    }

    # 2) Markdown metadata table rows: | Field | Value |
    foreach ($line in ($text -split "\r?\n")) {
        if ($line -match '^\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*$') {
            $k = ($Matches[1]).Trim()
            $v = ($Matches[2] -replace '^[`"'']+', '' -replace '[`"'']+$', '').Trim()
            if (-not $status -and $k -ieq 'Status') { $status = $v }
            if (-not $id -and ($k -ieq 'Document ID' -or $k -ieq 'Spec Under Review')) { $id = $v }
        }
    }

    $acNames = [regex]::Matches($text, '\bAC-\d+') | ForEach-Object { $_.Value } | Select-Object -Unique
    $acCount = @($acNames).Count

    [pscustomobject]@{
        File    = $File
        Text    = $text
        Status  = $status
        Id      = $id
        AcCount = $acCount
        IsSpec  = [bool]($id -and ($id -match '(?i)^SPEC-[A-Za-z0-9]+-[0-9]+$'))
    }
}

# Resolve files
$isDir = Test-Path -LiteralPath $Path -PathType Container
if ($isDir) {
    $files = @(Get-ChildItem -LiteralPath $Path -Recurse -File -Filter *.md |
        Where-Object { $_.Name -notmatch 'TEMPLATE|governance|specification-map|registry' } |
        ForEach-Object { $_.FullName })
} else {
    $files = @((Resolve-Path -LiteralPath $Path).Path)
}

$violations = New-Object System.Collections.Generic.List[string]
$checked = 0
$skipped = 0

foreach ($f in $files) {
    $meta = Get-SpecMeta -File $f
    $rel = $f

    if (-not $meta.IsSpec) {
        if (-not $isDir) {
            $violations.Add("NOT-A-SPEC  $rel  (no Status/ID metadata found)") | Out-Null
        } else {
            $skipped++
        }
        continue
    }

    $checked++
    $st = if ($meta.Status) { $meta.Status.ToUpperInvariant() } else { $null }

    if (-not $st) {
        $violations.Add("NO-STATUS   $rel") | Out-Null
        continue
    }

    if ($allowed -notcontains $st) {
        $violations.Add("BAD-STATUS  $rel  status=$st (allowed: $($allowed -join ', '))") | Out-Null
    }

    if ($Implementable -contains $st) {
        if ($meta.AcCount -eq 0) {
            $violations.Add("NO-AC       $rel  status=$st but no Acceptance Criteria (AC-<n>)") | Out-Null
        }
        if (-not $SkipCompleteness) {
            if ($meta.Text -notmatch '(?i)In Scope|Out of Scope') {
                $violations.Add("NO-SCOPE    $rel  status=$st but no explicit Scope (In/Out)") | Out-Null
            }
            if ($meta.Text -notmatch '(?i)Test Plan|Traceability') {
                $violations.Add("NO-TESTPLAN $rel  status=$st but no Test Plan or Traceability mapping") | Out-Null
            }
        }
    }

    if ($RequireApproved -and ($Approvedish -notcontains $st)) {
        $violations.Add("NOT-APPROVED $rel  status=$st (RequireApproved)") | Out-Null
    }

    if ($EnforceGate -and (($st -eq 'IMPLEMENTING') -or ($st -eq 'VALIDATED'))) {
        $dir = Split-Path -Parent $f
        $needle = if ($meta.Id) { [regex]::Escape($meta.Id) } else { [regex]::Escape([IO.Path]::GetFileNameWithoutExtension($f)) }
        $reviews = @(Get-ChildItem -LiteralPath $dir -Recurse -File -Filter *.md -ErrorAction SilentlyContinue |
            Where-Object { $_.FullName -ne $f })
        $passing = $false
        foreach ($r in $reviews) {
            $rt = Get-Content -LiteralPath $r.FullName -Raw -Encoding UTF8
            if ($rt -match $needle) {
                if ($rt -match '(?i)gate\s*state[^\n]{0,25}?(PASSED|PASSED_WITH_RISKS)') { $passing = $true; break }
                if ($rt -match '(?i)^\s*\|\s*Gate state\s*\|.*(PASSED|PASSED_WITH_RISKS)') { $passing = $true; break }
            }
        }
        if (-not $passing) {
            $violations.Add("NO-GATE     $rel  status=$st but no passing delivery review for $needle") | Out-Null
        }
    }
}

Write-Host "check-spec: scanned $($files.Count) file(s); specs=$checked; skipped=$skipped; violations=$($violations.Count)"
foreach ($v in $violations) { Write-Host ("  " + $v) }

if ($violations.Count -gt 0) { exit 1 }
exit 0
