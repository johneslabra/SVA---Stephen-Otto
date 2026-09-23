# Guide 4 — Making the one-line setup work (for the lead, once)

> **You probably do not need this.** VAs who have Antigravity set up by pasting a message
> into it — see `guides/05-messages-to-send.md`. Nothing is downloaded from a
> public link, so there is nothing to host. This guide only matters if you also want the
> terminal one-liner to work for someone without Antigravity.

The one-line setup that new VAs paste starts by downloading `scripts/setup-va.sh`
from the internet. A brand new VA has no GitHub login yet, so that download has
to work **without any credentials**.

Right now it does not. The template repository is private, so the link returns
"not found" and the VA sees an error before they have started.

## Pick one of these, once

### Option 1 — put just the setup script in a small public repository (recommended)

1. Create a new **public** repository, e.g. `sva-setup`.
2. Copy `scripts/setup-va.sh` into it.
3. Use that repository's raw link in the guides and in the message you send VAs.

Nothing client-related lives in that repository — only the setup script — so
making it public gives nothing away.

When you change `setup-va.sh` here, copy it across. It changes rarely.

### Option 2 — make the template repository public

The template holds no client data: it is all blank forms and instructions. If you
are comfortable with the instructions and the skills catalogue being visible, this
is the least work, and the links in the guides already point at it.

Do **not** make a client repository public. Those hold real client details.

### Option 3 — host the script anywhere else that is publicly readable

Any plain link that returns the file will do. Update the link in:

- `guides/00-github-login.md`
- `guides/02-new-va-new-niche.md`
- `guides/03-replacement-va.md`

## Check it worked

From a computer that has never logged in to GitHub, or in a private browser window:

```
https://raw.githubusercontent.com/OWNER/REPO/main/scripts/setup-va.sh
```

You should see the script text. If you see "404" or "Not Found", it is still
private and the one-line setup will not work for a new VA.

## Until then

New VAs follow the by-hand steps in `guides/00-github-login.md`. They still work.
