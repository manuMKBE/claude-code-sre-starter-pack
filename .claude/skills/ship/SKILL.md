---
name: ship
description: Ships finished work — commit + PR description from the real diff. Use only when the work is implemented, tested, and reviewed.
---

Ship the current work. Follow these steps in order:

1. Check status: run `git status` and `git diff` to see exactly what changed.
2. Verify: run the repo's test command from CLAUDE.md and confirm it passes. If tests fail, STOP and report the failure — do not ship.
3. Review: ask the code-reviewer and security-auditor subagents to review the diff (summaries only).
4. Commit: write a clear commit message from the actual diff (what changed, why) — never invent changes that are not in the diff.
5. PR description: draft a short description from the diff — what, why, how to test, risks. Show it to the user before any push.
6. Do NOT push, force-push, or deploy without the user's explicit yes.
