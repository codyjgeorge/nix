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
                hash = "sha256-5WoV3bNEmmbCKBSwCgH9n5x8IKwq9D5mPswzbKNtUy0=";
                name = "source";
              } + "/pkgs/by-name/sp/spicetify-cli/package.nix"
            ) { };
          })
        ];
      };

}
