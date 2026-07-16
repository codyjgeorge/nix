{ config, pkgs, ... }:

{
      nixpkgs = {
        overlays = [
          (final: prev: {
            # Temporary: test spicetify-cli wrapper fix from neonvoidx/nixpkgs
            spicetify-cli = final.callPackage (
              final.fetchFromGitHub {
                owner = "neonvoidx";
                repo = "nixpkgs";
                rev = "spicetify-cli-fix";
                hash = "sha256-EbHtnei7167fm5ZzK3LoRdjKQhgkMpLqF9ERH04phQU=";
                name = "source";
              } + "/pkgs/by-name/sp/spicetify-cli/package.nix"
            ) { };
          })
        ];
      };

}
