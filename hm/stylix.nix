{ config, lib, pkgs, inputs, ... }:

{
    stylix = {
        targets = {
            kitty.enable = false;
            hyprland.enable = false;
            nvf.enable = false;
            obsidian.enable = false;
            spicetify.enable = false;
            noctalia.enable = false;
            vesktop.enable = false;
            rofi.enable = false;
        };

        cursor = {
            name = "eldritch-watery-tomb-blue-cursors"; # "eldritch-color-name-here-cursors", also update package below
            package = inputs.eldritch-cursors.packages.${pkgs.stdenv.hostPlatform.system}.watery-tomb-blue;
            size = 24;
        };

    };
    home.pointerCursor.hyprcursor.enable = true;
}
