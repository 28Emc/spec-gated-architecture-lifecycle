#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Scaffold a spec-gated project structure using spec-gated-architecture-lifecycle templates.

.DESCRIPTION
    Copies templates/project-bootstrap to target directory, replacing placeholders:
    <project>, <system>, <context>, <owner>, <date>

.PARAMETER Target
    Target directory to scaffold into. Created if it does not exist.

.PARAMETER Project
    Project name (default: <project>)

.PARAMETER System
    System name (default: <system>)

.PARAMETER Context
    Short context (default: <context>)

.PARAMETER Owner
    Owner/maintainer (default: <owner>)

.EXAMPLE
    .\scaffold.ps1 -Target C:\projects\my-app -Project my-app -Owner team-x
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Target,

    [string]$Project = "<project>",
    [string]$System = "<system>",
    [string]$Context = "<context>",
    [string]$Owner = "<owner>"
)

$ErrorActionPreference = "Stop"

# Resolve paths
$SkillRoot = Split-Path -Parent $PSScriptRoot
$Bootstrap = Join-Path $SkillRoot "templates\project-bootstrap"

if (-not (Test-Path $Bootstrap)) {
    Write-Error "Bootstrap templates not found: $Bootstrap"
    exit 1
}

# Create target
if (-not (Test-Path $Target)) {
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
    Write-Host "Created target: $Target"
}

# Check if target is empty (warn but continue)
$existing = Get-ChildItem -Path $Target -Force | Where-Object { $_.Name -notin @('.git') }
if ($existing.Count -gt 0) {
    Write-Warning "Target is not empty ($($existing.Count) items). Scaffolding will overwrite files with same names."
}

$Date = (Get-Date).ToString("yyyy-MM-dd")

Write-Host "Scaffolding spec-gated structure..."
Write-Host "  Skill: $SkillRoot"
Write-Host "  Bootstrap: $Bootstrap"
Write-Host "  Target: $Target"
Write-Host "  Replacements: Project=$Project, System=$System, Context=$Context, Owner=$Owner, Date=$Date"

# Copy recursively
$files = Get-ChildItem -Path $Bootstrap -Recurse -File
foreach ($f in $files) {
    $rel = $f.FullName.Substring($Bootstrap.Length).TrimStart('\','/')
    $dest = Join-Path $Target $rel
    $destDir = Split-Path $dest -Parent
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }
    # Read, replace, write
    $text = Get-Content -Path $f.FullName -Raw -Encoding UTF8
    $text = $text -replace '<project>', $Project
    $text = $text -replace '<system>', $System
    $text = $text -replace '<context>', $Context
    $text = $text -replace '<owner>', $Owner
    $text = $text -replace '<date>', $Date
    Set-Content -Path $dest -Value $text -Encoding UTF8
    Write-Host "  Created: $rel"
}

# SDD extras: spec template + validator (single source of truth)
$SpecsDir = Join-Path $Target "specs"
if (-not (Test-Path $SpecsDir)) { New-Item -ItemType Directory -Path $SpecsDir -Force | Out-Null }

$SpecTemplate = Join-Path $SkillRoot "templates\specifications\behavior-specification.md"
if (Test-Path $SpecTemplate) {
    $tpl = Get-Content -Path $SpecTemplate -Raw -Encoding UTF8
    $tpl = $tpl -replace '<project>', $Project -replace '<system>', $System -replace '<context>', $Context -replace '<owner>', $Owner -replace '<date>', $Date
    Set-Content -Path (Join-Path $SpecsDir "_TEMPLATE-behavior-specification.md") -Value $tpl -Encoding UTF8
    Write-Host "  Created: specs\_TEMPLATE-behavior-specification.md"
}

$ScriptsDir = Join-Path $Target "scripts"
if (-not (Test-Path $ScriptsDir)) { New-Item -ItemType Directory -Path $ScriptsDir -Force | Out-Null }
foreach ($s in @("check-spec.ps1", "check-spec.sh")) {
    $src = Join-Path $SkillRoot ("scripts\" + $s)
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination (Join-Path $ScriptsDir $s) -Force
        Write-Host "  Created: scripts\$s"
    }
}

Write-Host "`nDone. Next: review AGENTS.md and docs/project-context.md (fill placeholders)."
Write-Host "Validate specs with: powershell -ExecutionPolicy Bypass -File .\scripts\check-spec.ps1 -Path .\specs -RequireApproved"
Write-Host "References: spec-gated-architecture-lifecycle/references/implementation-delivery-gate.md"
