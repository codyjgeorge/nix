{ config, lib, pkgs, ... }:

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
        };
    };
}
