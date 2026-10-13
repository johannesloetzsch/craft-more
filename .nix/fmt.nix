# `nix fmt` entry point for the whole repository — component-independent
# meta-tooling. treefmt drives the official nixfmt (RFC 166). Add more file
# types later by extending the `[formatter.*]` tables in `config`.
{ pkgs }:
let
  config = pkgs.writeText "treefmt.toml" ''
    [formatter.nixfmt]
    command = "nixfmt"
    includes = [ "*.nix" ]
  '';
in
pkgs.writeShellApplication {
  name = "treefmt";
  runtimeInputs = [
    pkgs.treefmt
    pkgs.nixfmt-rfc-style
  ];
  text = ''
    exec treefmt --config-file ${config} "$@"
  '';
}
