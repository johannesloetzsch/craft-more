{
  description = "craft-more";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { self, nixpkgs }:
    let
      # Single source of truth for the version of every derivation in the flake.
      version = "0.1.0";

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Skill names derived from the repository.
      skills = import ./docs/nix/lib/skills.nix {
        lib = nixpkgs.lib;
        src = self;
      };
    in
    {
      packages = forAllSystems (system: {
        docs = import ./docs/nix/package.nix {
          pkgs = nixpkgs.legacyPackages.${system};
          inherit self version;
        };
      });

      # Parameterised entry point, e.g.
      #   (builtins.getFlake …).lib.x86_64-linux.mkDocs "https://example.org/"
      lib = forAllSystems (system: {
        mkDocs =
          siteUrl:
          import ./docs/nix/package.nix {
            pkgs = nixpkgs.legacyPackages.${system};
            inherit self version siteUrl;
          };
      });

      devShells = forAllSystems (system: {
        docs = import ./docs/nix/devShell.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };
      });

      checks = forAllSystems (system: {
        docs = import ./docs/nix/check.nix {
          pkgs = nixpkgs.legacyPackages.${system};
          docs = self.packages.${system}.docs;
          inherit skills;
        };
        fmt = import ./.nix/fmt-check.nix {
          pkgs = nixpkgs.legacyPackages.${system};
          fmt = self.formatter.${system};
          src = self;
        };
      });

      formatter = forAllSystems (
        system:
        import ./.nix/fmt.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        }
      );
    };
}
