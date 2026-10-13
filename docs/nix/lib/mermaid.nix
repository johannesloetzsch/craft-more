# The Mermaid browser bundle for the docs site, pinned by the flake's nixpkgs.
#
# nixpkgs ships no standalone Mermaid derivation, so we take the asset that
# mdbook-mermaid embeds (`include_bytes!`) and materialize it with the tool's
# own `install` command. `pkgs.mdbook-mermaid` is pinned by flake.lock, so
# bumping the nixpkgs input is the single lever that moves this version
# (currently Mermaid 11.6.0).
{ pkgs }:
pkgs.runCommand "mermaid.min.js" { nativeBuildInputs = [ pkgs.mdbook-mermaid ]; } ''
  mkdir -p book
  touch book/book.toml
  mdbook-mermaid install book
  install -Dm644 book/mermaid.min.js "$out"
''
