#!/usr/bin/env bash
# Scaffold a spec-gated project structure (POSIX)

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <target> [project] [system] [context] [owner]"
  echo "Example: $0 /path/to/project my-app my-sys 'context' team-x"
  exit 1
fi

TARGET="$1"
PROJECT="${2:-<project>}"
SYSTEM="${3:-<system>}"
CONTEXT="${4:-<context>}"
OWNER="${5:-<owner>}"
DATE=$(date +%Y-%m-%d)

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SKILL_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
BOOTSTRAP="$SKILL_ROOT/templates/project-bootstrap"

if [ ! -d "$BOOTSTRAP" ]; then
  echo "Error: Bootstrap not found: $BOOTSTRAP"
  exit 1
fi

mkdir -p "$TARGET"

echo "Scaffolding..."
echo "  Target: $TARGET"
echo "  Project: $PROJECT Owner: $OWNER Date: $DATE"

# Copy and replace
find "$BOOTSTRAP" -type f -print0 | while IFS= read -r -d '' f; do
  rel="${f#$BOOTSTRAP/}"
  dest="$TARGET/$rel"
  mkdir -p "$(dirname "$dest")"
  sed -e "s|<project>|$PROJECT|g" -e "s|<system>|$SYSTEM|g" -e "s|<context>|$CONTEXT|g" -e "s|<owner>|$OWNER|g" -e "s|<date>|$DATE|g" "$f" > "$dest"
  echo "  Created: $rel"
done

# SDD extras: spec template + validator (single source of truth)
mkdir -p "$TARGET/specs" "$TARGET/scripts"

SPEC_TEMPLATE="$SKILL_ROOT/templates/specifications/behavior-specification.md"
if [ -f "$SPEC_TEMPLATE" ]; then
  sed -e "s|<project>|$PROJECT|g" -e "s|<system>|$SYSTEM|g" -e "s|<context>|$CONTEXT|g" -e "s|<owner>|$OWNER|g" -e "s|<date>|$DATE|g" \
    "$SPEC_TEMPLATE" > "$TARGET/specs/_TEMPLATE-behavior-specification.md"
  echo "  Created: specs/_TEMPLATE-behavior-specification.md"
fi

for s in check-spec.ps1 check-spec.sh; do
  if [ -f "$SCRIPT_DIR/$s" ]; then
    cp "$SCRIPT_DIR/$s" "$TARGET/scripts/$s"
    echo "  Created: scripts/$s"
  fi
done

echo "Done. Validate specs with: ./scripts/check-spec.sh ./specs --require-approved"
