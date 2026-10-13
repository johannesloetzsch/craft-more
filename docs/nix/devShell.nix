# Interactive shell for working on the documentation site.
{ pkgs }:
let
  python = import ./lib/pythonDeps.nix { inherit pkgs; };
  mermaid = import ./lib/mermaid.nix { inherit pkgs; };
in
pkgs.mkShell {
  packages = [ python ];
  shellHook = ''
    mkdir -p docs/javascripts
    ln -sf ${mermaid} docs/javascripts/mermaid.min.js
    echo "craft-more documentation shell"
    echo
    echo "  serve:  mkdocs serve --config-file docs/mkdocs.yml"
    echo "  build:  mkdocs build --strict --config-file docs/mkdocs.yml --site-dir \"\$(mktemp -d)\""
    echo
  '';
}
