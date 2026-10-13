# Derives the sorted list of skill names from the repository itself, so the
# check can never drift from the skills that actually exist.
#
# A skill is a direct child directory of <src>/skills/ that contains a README.md
# (every skill is authored README-first; SKILL.md exists only for mature skills).
#
# Pure and reproducible: `src` is the flake source (`self`), pinned by its hash,
# and `readDir`/`pathExists` run at evaluation time on that store path — no
# network, no environment, no IFD.
#
# Caveat (git flakes): the source copy contains only tracked files, so a skill
# directory that has not been `git add`-ed is invisible here.
{ lib, src }:
let
  skillsDir = src + "/skills";

  # A real skill: a sub-directory that carries a README.md.
  isSkill = name: type: type == "directory" && builtins.pathExists (skillsDir + "/${name}/README.md");
in
# readDir returns an attrset whose key order is not stable, so sort the names
# to keep the resulting list — and everything derived from it — reproducible.
lib.sort (a: b: a < b) (builtins.attrNames (lib.filterAttrs isSkill (builtins.readDir skillsDir)))
