# The Python environment shared by the docs package and the dev shell.
{ pkgs }:
pkgs.python3.withPackages (ps: [
  ps.mkdocs
  ps.mkdocs-material
])
