#!/usr/bin/env bash
# check-spec.sh — validate specification-gate metadata (POSIX)
#
# Enforces "only APPROVED specifications are implementable".
# Status is read from YAML frontmatter (status: X) OR a metadata table row
# (| Status | `X` |).
#
# Usage:
#   ./check-spec.sh <path> [--require-approved] [--enforce-gate] [--skip-completeness]
#
# Exit code 0 = OK, 1 = violations.
#
# Completeness checks (on for APPROVED/IMPLEMENTING/VALIDATED specs unless
# --skip-completeness): Acceptance Criteria (AC-<n>), explicit Scope
# (In/Out), and a Test Plan or Traceability mapping. --enforce-gate requires
# an IMPLEMENTING/VALIDATED spec to have a delivery review containing its spec
# ID with Gate state PASSED or PASSED_WITH_RISKS.

set -u

PATH_ARG=""
REQUIRE_APPROVED=0
ENFORCE_GATE=0
SKIP_COMPLETENESS=0

for arg in "$@"; do
  case "$arg" in
    --require-approved)     REQUIRE_APPROVED=1 ;;
    --enforce-gate)         ENFORCE_GATE=1 ;;
    --skip-completeness)    SKIP_COMPLETENESS=1 ;;
    *)                      PATH_ARG="$arg" ;;
  esac
done

if [ -z "$PATH_ARG" ]; then
  echo "Usage: $0 <path> [--require-approved] [--enforce-gate]" >&2
  exit 2
fi

ALL_STATUSES="DRAFT IN_REVIEW APPROVED IMPLEMENTING VALIDATED DEPRECATED REJECTED"
IMPLEMENTABLE="APPROVED IMPLEMENTING VALIDATED"

in_list() { # $1=needle $2=space-separated haystack
  case " $2 " in *" $1 "*) return 0 ;; *) return 1 ;; esac
}

get_status() { # $1=file
  local f="$1" s=""
  s=$(awk 'BEGIN{c=0} /^---[[:space:]]*$/{c++; if(c==2) exit; next} c==1{print}' "$f" \
      | grep -iE '^[[:space:]]*status[[:space:]]*:' | head -n1)
  if [ -n "$s" ]; then
    s=$(printf '%s' "$s" | sed -E 's/^[^:]*:[[:space:]]*//; s/[`"'"'"']//g' | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')
  else
    s=$(grep -iE '^[[:space:]]*\|[[:space:]]*Status[[:space:]]*\|' "$f" | head -n1 \
        | awk -F'|' '{print $3}' | sed -E 's/[`"'"'"']//g; s/^[[:space:]]+//; s/[[:space:]]+$//')
  fi
  printf '%s' "$s" | tr '[:lower:]' '[:upper:]'
}

is_spec() { # $1=file
  [ "$(spec_id "$1")" ] && printf '%s' "$(spec_id "$1")" | grep -qiE '^SPEC-[A-Za-z0-9]+-[0-9]+$' && return 0
  return 1
}

spec_id() { # $1=file
  local id v
  id=$(grep -iE '^[[:space:]]*\|[[:space:]]*(Document ID|Spec Under Review)[[:space:]]*\|' "$1" 2>/dev/null | head -n1)
  if [ -n "$id" ]; then
    v=$(printf '%s' "$id" | awk -F'|' '{print $3}')
  else
    v=$(grep -iE '^[[:space:]]*(id|spec[_-]?id|document[_-]?id)[[:space:]]*:' "$1" 2>/dev/null | head -n1 | awk -F: '{print $2}')
  fi
  printf '%s' "$v" | sed -E 's/[`"'"'"']//g; s/^[[:space:]]+//; s/[[:space:]]+$//'
}

has_any() { # $1=file, remaining args patterns
  local f="$1"; shift
  local p
  for p in "$@"; do
    grep -qiE "$p" "$f" 2>/dev/null && return 0
  done
  return 1
}

count_ac() { # $1=file
  grep -oE '\bAC-[0-9]+' "$1" 2>/dev/null | sort -u | wc -l | tr -d ' '
}

gate_passing() { # $1=dir $2=self $3=spec-id
  local dir="$1" self="$2" needle="$3" r
  [ -z "$needle" ] && needle=$(basename "$self" .md)
  while IFS= read -r r; do
    [ "$r" = "$self" ] && continue
    grep -qi "$needle" "$r" 2>/dev/null || continue
    if grep -qiE 'gate[[:space:]]*state.{0,25}(PASSED|PASSED_WITH_RISKS)' "$r" 2>/dev/null; then
      return 0
    fi
    if grep -qiE '^[[:space:]]*\|[[:space:]]*Gate state[[:space:]]*\|.*(PASSED|PASSED_WITH_RISKS)' "$r" 2>/dev/null; then
      return 0
    fi
  done < <(find "$dir" -type f -name '*.md' 2>/dev/null)
  return 1
}

ORIG_DIR="$PATH_ARG"
if [ -d "$PATH_ARG" ]; then
  FILES=$(find "$PATH_ARG" -type f -name '*.md' ! -name '*TEMPLATE*' ! -name '*governance*' ! -name '*specification-map*' ! -name '*registry*')
  SCAN_DIR=1
elif [ -f "$PATH_ARG" ]; then
  FILES="$PATH_ARG"
  SCAN_DIR=0
else
  echo "check-spec: path not found: $PATH_ARG" >&2
  exit 2
fi

VIOLATIONS=0
CHECKED=0
SKIPPED=0
TOTAL=0

while IFS= read -r f; do
  [ -z "$f" ] && continue
  TOTAL=$((TOTAL + 1))

  if ! is_spec "$f"; then
    if [ "$SCAN_DIR" -eq 0 ]; then
      echo "  NOT-A-SPEC  $f  (no Status/ID metadata found)"
      VIOLATIONS=$((VIOLATIONS + 1))
    else
      SKIPPED=$((SKIPPED + 1))
    fi
    continue
  fi

  CHECKED=$((CHECKED + 1))
  ST=$(get_status "$f")

  if [ -z "$ST" ]; then
    echo "  NO-STATUS   $f"; VIOLATIONS=$((VIOLATIONS + 1)); continue
  fi

  if ! in_list "$ST" "$ALL_STATUSES"; then
    echo "  BAD-STATUS  $f  status=$ST"; VIOLATIONS=$((VIOLATIONS + 1))
  fi

  AC=$(count_ac "$f")
  if in_list "$ST" "$IMPLEMENTABLE"; then
    if [ "$AC" -eq 0 ]; then
      echo "  NO-AC       $f  status=$ST but no Acceptance Criteria (AC-<n>)"
      VIOLATIONS=$((VIOLATIONS + 1))
    fi
    if [ "$SKIP_COMPLETENESS" -eq 0 ]; then
      if ! has_any "$f" 'In Scope|Out of Scope'; then
        echo "  NO-SCOPE    $f  status=$ST but no explicit Scope (In/Out)"
        VIOLATIONS=$((VIOLATIONS + 1))
      fi
      if ! has_any "$f" 'Test Plan|Traceability'; then
        echo "  NO-TESTPLAN $f  status=$ST but no Test Plan or Traceability mapping"
        VIOLATIONS=$((VIOLATIONS + 1))
      fi
    fi
  fi

  if [ "$REQUIRE_APPROVED" -eq 1 ] && ! in_list "$ST" "$IMPLEMENTABLE"; then
    echo "  NOT-APPROVED $f  status=$ST (RequireApproved)"
    VIOLATIONS=$((VIOLATIONS + 1))
  fi

  if [ "$ENFORCE_GATE" -eq 1 ] && { [ "$ST" = "IMPLEMENTING" ] || [ "$ST" = "VALIDATED" ]; }; then
    SPEC_ID=$(spec_id "$f")
    if ! gate_passing "$(dirname "$f")" "$f" "$SPEC_ID"; then
      echo "  NO-GATE     $f  status=$ST but no passing delivery review for $SPEC_ID"
      VIOLATIONS=$((VIOLATIONS + 1))
    fi
  fi
done <<< "$FILES"

echo "check-spec: scanned $TOTAL file(s); specs=$CHECKED; skipped=$SKIPPED; violations=$VIOLATIONS"
[ "$VIOLATIONS" -gt 0 ] && exit 1
exit 0
