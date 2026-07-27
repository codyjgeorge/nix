{ config, pkgs, inputs, ... }:

{
        programs.spicetify =
        let
                spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
        {
                enable = true;
                wayland = true;

                theme = spicePkgs.themes.sleek;
                colorScheme = "Eldritch";
        };
}
