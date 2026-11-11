# Claude Code SRE Starter Pack

A safe, minimal Claude Code starter kit for SRE and enterprise engineers adopting Claude Code — where secrets, uncontrolled pushes, and runaway agents are the blocker, not the code.

Built by Manoj Kumar Baba Eswarappa, Senior Director, Site Reliability Engineering. This is a personal project, not Morgan Stanley work.

## What is in here

- `CLAUDE.md` — lean project instructions template (edit the bracketed parts for your repo)
- `.claude/settings.json` — permission mode + deny rules + one format hook
- `.claude/agents/code-reviewer.md` — read-heavy reviewer subagent (Haiku, summaries only)
- `.claude/agents/debugger.md` — reproduce-first debugger subagent (Haiku)
- `.claude/agents/security-auditor.md` — secrets / permissions scanner subagent (Haiku, never prints secret values)
- `.claude/skills/ship/SKILL.md` — the `/ship` skill: commit + PR description from the real diff, no push without your yes
- `.claude/hooks/format-after-edit.sh` — example format hook (Prettier for JS/TS, swap for Black/Ruff for Python)
- `progress.md` — harness template for long tasks

## Install

1. Install Claude Code and log in. You need a Claude plan that includes Claude Code (Pro or higher).
2. Make a practice folder and copy this pack into a repo root:
   - `CLAUDE.md` to the repo root
   - `.claude/` to the repo root
   - `progress.md` to the repo root
3. **Read `.claude/settings.json` before you run anything.** The deny list blocks reading `.env` / secrets and dangerous commands. If a rule blocks something you actually need, edit the file — never just delete the whole deny list.
4. Adjust the format hook to your stack: it currently tries Prettier (JS/TS) and otherwise does nothing. For Python, swap it for `black` / `ruff` — see the comment in the script.
5. Run `claude`, then ask Claude to explore the repo first. Try `/ship` only for real, tested work.

## The gate (non-negotiable)

- Claude shows permission / CLAUDE.md changes as diffs first. Nothing writes until you say go.
- Risky paths are denied *before* anything runs.
- After every correction, tell Claude: "Update your CLAUDE.md so you don't make that mistake again."
- No `bypassPermissions`. No force-push to main. No deploys without your explicit yes.
- Subagents return summaries only — raw files and logs stay out of the main session unless you ask for one file by name.

## Model routing

Main session: strong model for planning, decisions, and review. The three subagents run on Haiku (cheap) and return summaries only. For a critical review, bump `code-reviewer` to Sonnet/Opus by editing its `model:` line.

## What is NOT in here (on purpose)

No MCP servers yet, no worktrees, no bulk community plugins. This pack is deliberately small. Add one thing at a time, read its SKILL.md / docs, check its permissions and rollback, test it, then keep or delete it.

## Roadmap

Next, in this repo: incident-summary skill, log-triage and postmortem workflows, a PR-review subagent team, and read-only MCP workflows — all built and published here under MIT.

## License

MIT — see `LICENSE`.
