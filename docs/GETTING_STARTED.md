# Getting started

## a) Testing without installation

For a first test in your coding agent no installation is required.

In an arbitrary prompt with a model trained for tooling, ask to load any of the [Skills from Catalog](https://github.com/johannesloetzsch/craft-more/blob/main/docs/CATALOG.md) of this repo. Then request to use the skill.

The best results are to be expected when you point to a **raw** file called **SKILL.md** in your **prompt**, e.g.:

```prompt
Download and use the skill: https://raw.githubusercontent.com/johannesloetzsch/craft-more/refs/heads/main/skills/emoji-markers/SKILL.md
```


## b) Usage in a single repository

To persistently open a set of skills whenever you open your coding agent in one of your repositories, edit or create an **AGENTS.md** file at the root of the repository. This file contains the **initial prompt** being read on startup.

Again, you can simply prompt to download and use any of the skills like when testing without installation.

Better results are expected when you download the skills first and refer to local files.
To test all craft-more skills together, clone the repository:

```bash
git clone https://github.com/johannesloetzsch/craft-more
```

Then request usage by writing into **your repo's AGENTS.md** something like:
```AGENTS.md
Use all skills referenced by ./craft-more/AGENTS.md
```

When you use your correct relative local path, this should be enough to chainload craft-more.


## c) Installation in user profile

### 1. **Register the skills** so your agent can find them.

This one **step depends on your coding agent** / harness, please look up the official documentation.

For example, the [documentation for opencode](https://opencode.ai/v2/docs/skills/#sources) suggests:

Edit `~/.config/opencode/opencode.jsonc`:
```json
{
  "$schema": "https://opencode.ai/config.json",
  "skills": [
    "~/Documents/src/craft-more/skills"
  ]
}
```
Note that the `skills`-directory is a subdirectory of the local clone of the `craft-more`-repo. This is the directory containing the subdirectories with the `*/SKILL.md` files.

All skills of craft-more should now be **available for loading** whenever they are requested — however, this only happens **once your prompts match the skills**.


To **autoload** a skill, trigger it in the **AGENTS.md** of your repository, e.g. with a prompt like:

```prompt
Load all craft-more skills
```


### 2. **Make the skills always-on** (optional, but recommended).

If you want to use craft-more for your user in **every opencode session**, you can add files to be loaded at startup to the **`instructions`** in `~/.config/opencode/opencode.jsonc`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "default_agent": "plan",
  "skills": [
    "~/Documents/src/craft-more/skills"
  ],
  "instructions": [
    "~/Documents/src/craft-more/AGENTS.md"
  ]
}
```

In this case we load the `craft-more/AGENTS.md` from a local clone of craft-more. This file will initialize craft-more the way intended by the authors.

> Note: The `default_agent` is an optional setting, but a good practice.


### 3. **Restart and verify.**

To ensure the setup worked, **please restart your coding agent** and see if it starts craft-more as expected.


## Next

Full details, options, and troubleshooting:

[**Install**](INSTALL.md){ .md-button }
[**Skills Catalog**](CATALOG.md){ .md-button }
