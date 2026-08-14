# Interview Prep

Paste a job description, get a researched company dossier and interview answers written in your own voice.

**Live: https://daynalee.github.io/interview-prep/**

Single static HTML file. No build step, no backend, no dependencies.

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

1. Create an API key at [console.anthropic.com](https://console.anthropic.com).
2. Open the site, paste the key under **Setup**.
3. Paste your background under **My profile**: who you are, your stories, your numbers, what drives you, samples of how you actually write.
4. Paste a job description and run it.

A full run costs a few cents in API usage and takes a few minutes, most of it web search.

## Why the profile matters more than the research

The research half is the easy half. What makes an answer yours is having real stories, exact numbers, and a sample of how you actually talk. A thin profile produces polished, accurate, forgettable answers. Paste more than feels necessary, including the unpolished writing.

## Notes

- Model: `claude-opus-5`, with the server-side web search tool.
- Streams both passes, and resumes across `pause_turn` so long research loops finish.
- Falls back to in-memory storage when a browser blocks site storage, and says so.
