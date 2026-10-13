# Builds the documentation site with mkdocs (Material theme) in strict mode.
{
  pkgs,
  self,
  version,
}:
let
  python = import ./lib/pythonDeps.nix { inherit pkgs; };
  mermaid = import ./lib/mermaid.nix { inherit pkgs; };
in
pkgs.stdenvNoCC.mkDerivation {
  pname = "craft-more-docs";
  inherit version;
  src = self;
  nativeBuildInputs = [ python ];
  buildPhase = ''
    runHook preBuild
    mkdocs build --strict --config-file docs/mkdocs.yml --site-dir "$out"
    install -Dm644 ${mermaid} "$out/docs/javascripts/mermaid.min.js"
    runHook postBuild
  '';
}
