# Getting started

Three steps to use these skills in opencode:

1. **Register the skills** so opencode can discover them.
2. **Make the rules always-on** (optional, but recommended).
3. **Restart and verify.**

## 1. Register all the skills

Tell opencode where the skills live. The path is scanned recursively for `**/SKILL.md`:

<!-- TODO filename -->
```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": { "paths": ["/home/vibe/src/vibe-less/skills"] }
}
```

## 2. Make the rules always-on

Skills load on demand. For rules that must always apply, use `AGENTS.md` (project) or `instructions` (global). See [`INSTALL.md`](INSTALL.md) for details.

## 3. Restart and verify

Config is loaded at startup and is not hot-reloaded — restart opencode.

Full details, options, and troubleshooting: [`INSTALL.md`](INSTALL.md). <!-- only here you find `opencode debug skills` (including | jq) -->
