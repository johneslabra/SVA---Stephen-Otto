# Guide 6 — Updating client folders made from an older template (Tech only)

The template changes. Client folders made before a change keep the old machinery until
someone updates them. This brings them up to date without touching any client work.

## What it does and does not touch

**Replaced:** the instructions (`CLAUDE.md`, `AGENTS.md`), `README.md`, everything in
`scripts/`, `guides/`, `skills/` and `_templates/`, plus `.gitattributes`, `.gitignore`
and `.claude/settings.json`.

**Never touched:** everything in `master/` — the client's details, and the list of who may
change them — and every service folder with its README, tasks and assets.

**Created only if missing:** `master/faqs.md`, because folders made before the customer
FAQs existed will not have it. If it is already there it is left alone.

The client's real name is put back into the files that carry it, so nothing reverts to
the blank placeholder.

## The easy way: paste a prompt into Antigravity

Open Antigravity on any folder and paste in `guides/prompts/update-clients-prompt.txt`.
It finds your template, finds your client folders, asks you to confirm which ones, updates
them, checks each one afterwards, and only uploads once you have seen the summary and said
yes.

That is the whole job. The manual steps below do the same thing if you prefer them.

## How to run it by hand

From your copy of the template:

```bash
cd path/to/client-template
git pull

bash scripts/update-client-repo.sh ~/Desktop/SVA/bright-smile-dental
```

Several at once:

```bash
bash scripts/update-client-repo.sh ~/Desktop/SVA/*
```

It saves any unsaved work in the folder first, makes the changes, stages them, and stops.
**Nothing is uploaded.** Look at what changed, then:

```bash
cd ~/Desktop/SVA/bright-smile-dental
git commit -m "Update from template"
bash scripts/sync.sh
```

Running it twice is safe. The second run says "Already up to date".

## Before you update a folder someone else is working in

Tell the VA or CSP to close it first, and to let their work go to the team. If they are
mid-session their changes are saved anyway, but an update landing under them can produce a
confusing merge for them to see.

After updating, they should reopen the folder so the new instructions take effect.

## Checking it worked

In the updated folder:

```bash
python3 scripts/client-status.py
```

Expect "set up" or "partly set up" for a client that has been filled in. If it says
**NOT SET UP** for a client you know is filled in, stop and check `master/` — that would
mean something went wrong, and the AI will refuse to answer questions about that client.

## If a client folder was changed by hand

Anything customised inside `scripts/`, `guides/`, `skills/` or `_templates/` is
overwritten. Those are meant to be the same everywhere. If a client genuinely needs
something different, it belongs in that client's `master/` or niche README, not in the
machinery.
