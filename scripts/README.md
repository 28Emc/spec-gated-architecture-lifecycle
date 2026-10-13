# Scripts

## scaffold.ps1 (Windows, primary)

Instantiates `templates/project-bootstrap/` into a target directory, replacing placeholders.

```powershell
powershell -ExecutionPolicy Bypass -File .\scaffold.ps1 -Target "C:\path\to\project" -Project "my-project" -System "my-system" -Context "context" -Owner "team-x"
```

## scaffold.sh (POSIX)

```bash
chmod +x scaffold.sh
./scaffold.sh /path/to/project my-project my-system "context" team-x
```

## check-spec.ps1 / check-spec.sh (spec gate validator)

Validates specification metadata so the rule "only `APPROVED` specs are implementable" is machine-checkable. Reads status from YAML frontmatter (`status: X`) or a metadata table row (`| Status | `X` |`).

```powershell
# Windows
.\check-spec.ps1 -Path ..\my-project\specs -RequireApproved
.\check-spec.ps1 -Path ..\my-project\specs -EnforceGate
.\check-spec.ps1 -Path ..\my-project\specs -SkipCompleteness
```

```bash
# POSIX
./check-spec.sh ../my-project/specs --require-approved
./check-spec.sh ../my-project/specs --enforce-gate
./check-spec.sh ../my-project/specs --skip-completeness
```

Checks:
- spec has a recognizable `Status`
- status is within the allowed set
- implementable statuses (`APPROVED`/`IMPLEMENTING`/`VALIDATED`) have Acceptance Criteria (`AC-<n>`)
- implementable statuses also have an explicit **Scope** (In/Out) and a **Test Plan** or **Traceability** mapping (completeness; disable with `-SkipCompleteness` / `--skip-completeness`)
- with `-RequireApproved` / `--require-approved`: no spec below `APPROVED`
- with `-EnforceGate` / `--enforce-gate`: `IMPLEMENTING`/`VALIDATED` specs have a delivery review containing the spec's ID with `Gate state` `PASSED`/`PASSED_WITH_RISKS`

A file is treated as a spec only when its ID matches `SPEC-<word>-<n>` (e.g. `SPEC-CULINARY-001`). Delivery
reviews (`REV-<type>-<n>`), registers, governance, and registry documents are thus skipped automatically;
directory scans additionally filter out `*TEMPLATE*`, `*governance*`, `*specification-map*`, and `*registry*`
filenames.

Exit code `0` = valid, `1` = violations. Suitable for local use and CI.

## Guarantees (scaffold)
- Copies only generic bootstrap (no domain content)
- Replaces: `<project>`, `<system>`, `<context>`, `<owner>`, `<date>`
- UTF-8 preserved
- No MealMind/examples copied
- Warns if target not empty
- Adds an SDD-ready `specs/` (template + README) and copies `check-spec.*` into `scripts/`
