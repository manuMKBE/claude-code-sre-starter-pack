#!/bin/sh
# PostToolUse format hook — example only. Edit for your stack.
# It receives the edited file path on stdin as JSON in Claude Code's hook input;
# this simple version just formats JS/TS files with Prettier when available,
# and does nothing otherwise (safe no-op).
#
# For a Python project, replace the body with:
#   black "$FILE" 2>/dev/null || ruff format "$FILE" 2>/dev/null || true
#
# Keep hooks simple and idempotent: formatting twice must be harmless.

# Try to read the file path from hook input JSON (best effort; ignore failures)
FILE=$(python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [ -n "$FILE" ]; then
  case "$FILE" in
    *.js|*.ts|*.jsx|*.tsx|*.json|*.md)
      if command -v npx >/dev/null 2>&1; then
        npx --yes prettier --write "$FILE" >/dev/null 2>&1 || true
      fi
      ;;
  esac
fi
exit 0
