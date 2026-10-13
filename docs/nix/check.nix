# Flake check for the documentation site: asserts that the built tree (`docs`)
# contains every page it should — and nothing it should not.
#
# `skills` comes from lib/skills.nix, so the check expects exactly the skills
# that exist in the repository.
{
  pkgs,
  docs,
  skills,
}:
let
  # Required pages: the fixed top-level pages plus one index per skill.
  expected = [
    "index.html"
    "docs/GETTING_STARTED/index.html"
    "docs/INSTALL/index.html"
  ]
  ++ map (s: "skills/${s}/index.html") skills;
in
pkgs.runCommand "craft-more-docs-check" { } ''
  # Every expected page must be present in the built site.
  ${pkgs.lib.concatMapStrings (p: ''
    if [ ! -e ${docs}/${p} ]; then
      echo "missing page: ${p}" >&2
      exit 1
    fi
  '') expected}

  # SKILL.md is for mature skills only and must never become a page.
  if [ -e ${docs}/skills/emoji-markers/SKILL/index.html ]; then
    echo "SKILL.md should have been excluded" >&2
    exit 1
  fi

  # Regression guard: an overly broad exclude_docs once stripped the theme
  # assets — they must survive the build.
  if [ ! -d ${docs}/assets ]; then
    echo "theme assets are missing" >&2
    exit 1
  fi
  if ! ls ${docs}/assets/stylesheets/*.css >/dev/null 2>&1; then
    echo "no theme stylesheet found" >&2
    exit 1
  fi

  # Our own stylesheet must ship ...
  if [ ! -e ${docs}/docs/stylesheets/colors.css ]; then
    echo "stylesheet is missing" >&2
    exit 1
  fi

  # ... while the mkdocs config itself must not leak into the site.
  if [ -e ${docs}/docs/mkdocs.yml ]; then
    echo "config leaked into the site" >&2
    exit 1
  fi

  # The pinned Mermaid bundle must ship, injected after the mkdocs build.
  if [ ! -e ${docs}/docs/javascripts/mermaid.min.js ]; then
    echo "mermaid bundle is missing" >&2
    exit 1
  fi

  # ... and the custom fence must turn a ```mermaid block into a diagram.
  if ! grep -q 'class="mermaid"' ${docs}/skills/plan-build-workflow/index.html; then
    echo "mermaid diagram did not render in plan-build-workflow" >&2
    exit 1
  fi

  touch "$out"
''
