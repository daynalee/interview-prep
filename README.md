# Interview Prep

Paste a job description, get a researched company dossier and interview answers written in your own voice.

**Live: https://daynalee.github.io/interview-prep/**

Single static HTML file. No build step, no backend, no dependencies, **and no API key
required**.

## Three modes

- **Interview prep.** Dossier, fit map, answers, follow-up drilling, six researched questions
  to ask them, weakest-answer critique.
- **Application materials.** Cover letter, a short-answer bank at two lengths for application
  forms, resume vocabulary alignment against the posting, referral and recruiter notes, and an
  honest read on whether the application is worth the time.
- **Should I even apply.** Scores the role against your stated criteria and returns Apply,
  Apply if you can get a referral, or Skip. Designed to tell you no.

## Two ways to run it

**Build my prompt (default, free).** The page assembles your profile, the job description,
and the full research and voice instructions into one prompt, and copies it to your
clipboard. Paste that into Claude Code or claude.ai and send it. Claude does the research
and writes the answers on the Claude plan you already have. No key, no billing, nothing to
set up.

**Run it here (optional, paid).** If you save an Anthropic API key, the page can call the
API directly from your browser and stream both passes inline. An Anthropic API key is a
separate prepaid product from a Claude subscription, so most people should ignore this.

There is no third option: a static page with no backend cannot call a paid model without
somebody's key, and a shared key on a public page would let anyone spend it.

## How it works

Two passes that never blend, because doing both at once is what makes interview answers sound generic.

1. **Research.** Runs live web search and produces a dossier where every claim is tagged `[VERIFIED]` with a source URL, `[INFERRED]` with the reasoning, or `[UNKNOWN]`. Gaps are never filled with something plausible: an invented founder name repeated in an interview room is the worst thing a tool like this can do.
2. **Voice.** A separate pass drafts answers from your own profile and reaches into the dossier only for specifics. Only `[VERIFIED]` facts are allowed into an answer.

The test for every answer: swap in a different company name. If it still works, it is not finished.

LinkedIn blocks automated access, so the tool does not pretend to browse it. It searches what is publicly indexed, then hands you a short list of specific people to open yourself with what to look for on each.

## Your data

Your API key and your profile are stored in **your browser's localStorage only**. Neither is in this repository, and neither is sent anywhere except directly from your browser to the Anthropic API. Anyone else who opens the site gets an empty tool.

The key never touches a server of mine because there isn't one. Use **Clear saved data** on a shared machine.

## Setup

1. Paste your background under **My profile**: who you are, your stories, your numbers, what
   drives you, samples of how you actually write.
2. Paste a job description, set the round, press **Build my prompt**.
3. Paste the result into Claude and send it.

That is the whole setup. Nothing to install, nothing to pay for.

### Optional: running it in the page instead

**An Anthropic API key is not the same thing as a Claude subscription.** Claude Code and
claude.ai run on a Claude plan. The API is a separate product with its own prepaid billing.
If you have never used console.anthropic.com, you do not have a key, and anything else you
paste comes back as "API key is invalid".

If you want inline streaming anyway: create a key at
[console.anthropic.com](https://console.anthropic.com), buy credit under Billing, paste it
under **Setup**, then press **Test key**. That makes the cheapest possible call and shows
the API's own response, so a failure names the actual reason instead of a guess. A run costs
a few cents.

## Why the profile matters more than the research

The research half is the easy half. What makes an answer yours is having real stories, exact numbers, and a sample of how you actually talk. A thin profile produces polished, accurate, forgettable answers. Paste more than feels necessary, including the unpolished writing.

## Notes

- Model: `claude-opus-5`, with the server-side web search tool.
- Streams both passes, and resumes across `pause_turn` so long research loops finish.
- Falls back to in-memory storage when a browser blocks site storage, and says so.
