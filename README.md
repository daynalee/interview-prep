# Interview Prep

An application workbench. Track every role you are going after, and move each one from
research through to a mock interview, with output tailored to that company and to your own
background.

**Live: https://daynalee.github.io/interview-prep/**

One static HTML file. No build step, no backend, no dependencies, no API key.

## The seven steps

Each one copies a prompt. Paste it into Claude, then bring the result back into the page so
later steps reuse it.

1. **Research the company.** Web search. Every claim tagged `[VERIFIED]` with a source URL,
   `[INFERRED]` with the reasoning, or `[UNKNOWN]`. Gaps are never filled with something
   plausible.
2. **Should I apply.** Scores the role against your stated criteria and returns Apply, Apply
   if you can get a referral, or Skip. Built to say no.
3. **Application answers.** Answers their exact questions, each with its own length limit, or
   writes full materials (cover letter, short answer bank, resume alignment, outreach) if you
   have not added questions.
4. **Predict my questions.** Ranked into near certain, likely from the posting, likely from the
   company, the ones you should fear, and curveballs, with an order to prepare in.
5. **Draft prep answers.** Answers with a one-line spine to rebuild each in the room,
   follow-up drilling for the probes that come next, and six researched questions to ask them.
6. **Practice out loud.** Claude interviews you one question at a time, probes your answers,
   pushes back, then critiques.
7. **Debrief afterwards.** Turns your notes into concrete edits for your profile, so the next
   application starts from a better version of you.

## Why it is built this way

**Research once per company.** The dossier is stored on the application and reused by every
later step, rather than re-researched each time.

**Two passes, never blended.** Research produces cited facts; a separate pass writes from your
profile and may only use `[VERIFIED]` facts. Doing both at once is what makes answers generic.

**The page never calls a model.** It cannot scrape, because browsers block cross-origin
requests and job boards block bots anyway. So it captures structure, stores what Claude returns,
and builds the right prompt. Everything intelligent happens in Claude, on the plan you already
have.

**Per-question length limits with a real counter.** Paste an answer back into a question and
your browser counts it. That is the count their form applies, and it is more reliable than a
model's self-reported count.

**Your data stays yours.** Profile and applications live in this browser's localStorage only.
Nothing personal is in this repository. Anyone else who opens the site gets an empty tool. Use
**Back up** to export a JSON file, and **Restore** to move it to another device.

## Setup

**On your Mac, zero setup:**

```
~/interview-web/run.sh
```

That regenerates your profile from `~/interview-agent/me/`, starts a local server, and opens the
page with everything preloaded.

**On the hosted site, one time per device:** press **My profile**, then **Load from file**, and
pick `PROFILE-PASTE.md`. It saves itself and loads automatically on every visit after that. The
page tells you which situation you are in and why.

Your profile is deliberately not in this repository. The repo is public, so committing it would
publish your comp context, internal figures, and personal history to anyone who looks. One file
pick per device is the price of that not happening.

1. Get your profile in, by whichever route above.
2. Press **New**, fill in the company and paste the job description.
3. Work down the steps.

If you open `index.html` by double-clicking it, browsers block storage on `file://` and nothing
will persist, which is the one case where it really does ask every time. The page detects that
and tells you to use `run.sh` instead.

## Files

- `index.html`: everything. Deliberately one file. Splitting the script out introduced a real
  failure mode: GitHub Pages caches each file separately for 10 minutes, so a browser could end
  up with the markup and no script, which renders a page where nothing responds. One file cannot
  skew against itself.
- `profile.local.txt`: gitignored. If present, the page auto-loads it, so running locally needs
  no pasting. Never committed, never on the public site.

If the page ever does look dead, it now says so instead of failing silently, and a hard refresh
(Cmd Shift R) is the fix.
