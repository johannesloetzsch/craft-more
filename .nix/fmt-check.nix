# CI twin of `.nix/fmt.nix`: runs the formatter on a writable copy of the
# source and fails if it would change anything (the store is read-only).
#
# Notes: `--tree-root .` is required because without a VCS the treefmt default
# is the directory of the config file (a store path), which would make it walk
# /nix/store. `.git`/`.tmp` are dropped so only the source tree is considered.
{
  pkgs,
  fmt,
  src,
}:
pkgs.runCommand "craft-more-fmt-check" { nativeBuildInputs = [ fmt ]; } ''
  cp -r ${src} src
  chmod -R u+w src
  rm -rf src/.git src/.tmp
  cd src
  treefmt --tree-root . --walk filesystem --no-cache --fail-on-change
  touch "$out"
''
