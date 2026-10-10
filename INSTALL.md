# Install

Detailed installation for opencode.

## Requirements

- opencode (recent version). <!-- or alternatives… -->

<!-- step0: download to ~/src/craft-more or use a reference to the online repo -->

## 1. Register the skills

Add a `skills` block to your opencode config. `skills.paths` entries are directories scanned recursively for `**/SKILL.md`:

<!--
```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": {
    "paths": ["~/src/craft-more/skills"]
  }
}
```

-->

Config locations:

- Global: `~/.config/opencode/opencode.jsonc`
- Project: `./opencode.json` or `.opencode/opencode.json`

## Always-on rules

Skills are loaded on demand, so a rule applies only when its skill triggers. To apply rules in every session, use instructions.

### A) Project `AGENTS.md`

opencode auto-gathers `AGENTS.md`, `CLAUDE.md`, `.cursor/rules/`, `.cursorrules`, and `.github/copilot-instructions.md`. Running opencode with the working directory inside this repo auto-loads `AGENTS.md` — no config entry needed.

### B) Global instructions

Reference the file explicitly so it loads everywhere:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["~/src/craft-more/AGENTS.md"]
}
```

## Restart and verify

Config is loaded once at startup and is not hot-reloaded. Restart opencode, then:

```sh
opencode debug skill
```

The output lists discovered skills (e.g. `emoji-markers`).
