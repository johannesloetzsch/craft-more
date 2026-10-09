# uncertainty-and-verification

Verify whenever the actual purpose requires it — a protocol for keeping a shared, honest picture of how valid the information we process is.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Problem

Agents and humans easily drift apart on how trustable the information in a session is: important statements get phrased as absolute truth, unverified claims are acted on silently, and it stays unclear whether more research or information retrieval would have been worth the effort.

This skill attempts to solve that by:
- keeping a common, honest picture of what is verified, likely, or assumed
- preventing important statements from being stated as absolute truth
- aligning with the user before trusting relevant information, if further research/scouting or other retrieval would help

## Strategy (mock)

Planned approach, not implemented yet:
- attach confidence to statements (verified / likely / unverified / assumption) instead of asserting them flatly
- verify whenever verification is necessary for the actual purpose — no more, no less
- a check-before-trust step: before acting on relevant information, agree with the user whether more research or retrieval is worthwhile
- tie in with the `emoji-markers` vocabulary: ✅ `[OK]` for verified, ⚠️ `[WARN]` for uncertainty
