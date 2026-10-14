# Install

If you want to test craft-more without installing it permanently, consider the options at:

[**Getting started**](GETTING_STARTED.md){ .md-button }


## Warning

Craft-more is [in an early state](MATURITY.md). Not every feature is expected to fully work now.

> ⚠️ Warning: While craft-more tries to provide best practices, it only delivers skills running with the same privileges as your other prompts. Access control can only be provided by tools and not by skills. Don't expect craft-more to offer any additional layer of **security** for your host system and user profile! To protect your users' data and your system's integrity, please **use recommended sandboxes**. You should at least run your coding agent as an unprivileged user without access to private data of your other system user accounts. Better run it in an **isolated virtual machine**.


## Requirements

The skills provided by craft-more should work on **any coding agent** / harness.

Configuration will depend on the tools you use. The following instructions describe the configuration for [**opencode**](https://opencode.ai/) on Unix / Linux / WSL.


## Download & Configuration

For permanent installation of craft-more, clone it into a local directory of your choice:

```bash
cd ~/Documents/src/
git clone https://github.com/johannesloetzsch/craft-more
```

To configure it **always-on** for a user, edit **`~/.config/opencode/opencode.jsonc`**:

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


## Restart and debugging

Config is loaded once at startup and is not hot-reloaded. After restarting opencode, craft-more should greet you.

If it doesn't work as expected, you can debug the loaded skills using:
```bash
opencode debug skill | jq '.[].name'
```


## Next

Learn about available skills and try them out:

[**Skills Catalog**](CATALOG.md){ .md-button }
