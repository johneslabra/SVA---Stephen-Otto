# {{CLIENT_NAME}} — Client Repository

This repo is the single source of truth for all work done for **{{CLIENT_NAME}}**.
Every VA working on this client commits their work, notes, and task history here.

## How to get started

1. Log in to GitHub on your computer once: `guides/00-github-login.md`.
2. Clone this repo.
3. Open it in Claude Code or Antigravity.
4. Type: **Onboard me please**
5. The AI asks whether you are setting up a new client, a new VA on a new niche, or a replacement VA, then walks you through it.

Guides for each path are in `guides/` if you prefer to read them.

## Layout

```
master/          Client-wide context. Business, brand, contacts, tools, rules.
<Niche>/         One folder per service line (e.g. Social Media Manager, Web Development, GHL).
  README.md      What this service covers, scope, goals, recurring duties.
  tasks/         One markdown file per task. This is the history.
  assets/        Exports, screenshots, copies of deliverables (no secrets).
_templates/      Copy `_templates/niche/` to create a new niche folder.
guides/          Step-by-step guides: client setup, new VA new niche, replacement VA,
                 updating older client folders.
  prompts/       Ready-to-send setup prompts for a CSP and for a VA.
skills/          Catalog of add-on AI skills the AI can install when asked for something it can't do yet.
scripts/sync.sh  Pull + commit + push. Runs automatically; safe to run by hand.
                 Combines two VAs' edits to the same file without anyone getting stuck.
.gitattributes   Tells git to keep both VAs' work-log lines instead of raising a conflict.
.claude/         Claude Code hooks: pull on start, sync on stop.
CLAUDE.md        Instructions for Claude Code.
AGENTS.md        Instructions for Antigravity and other AI tools (same content).
```

## Rules

- **No passwords, API keys, or card details in this repo. Ever.** Reference the password manager entry name instead. See `master/tools-and-access.md`.
- **One task = one file** in `<Niche>/tasks/`. Use `_templates/niche/tasks/TEMPLATE.md`.
- **Update the task file, then commit.** Commit message format: `[Niche] short description`.
- **Syncing is automatic.** Claude Code pulls when you open the repo and pushes when you finish. On other tools, run `bash scripts/sync.sh`. Work is saved even if a task is unfinished.
- **Do not delete task files.** Set status to `done` or `cancelled`. History is the point.
- When a decision is made with the client, write it in the task file under **Decisions** with the date.

## Adding a new niche

```bash
cp -r _templates/niche "Social Media Manager"
```

Then fill in the new folder's `README.md` and commit.
