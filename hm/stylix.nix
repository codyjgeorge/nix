{ config, lib, pkgs, ... }:

{
    stylix = {
        targets = {
            kitty.enable = false;
            hyprland.enable = false;
            nvf.enable = false;
        };
    };
}
