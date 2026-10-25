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
            name = "eldritch-great-old-green-cursors";
            package = inputs.eldritch-cursors.packages.${pkgs.stdenv.hostPlatform.system}.great-old-green;
            size = 24;
        };

    };
    home.pointerCursor.hyprcursor.enable = true;
}
