{ config, lib, pkgs, ... }:

{
    programs.zathura = {
        enable = true;
        guioptions = "cshv"; # statusbar + command line + scrollbar
        font = "JetBrainsMono Nerd Font 10";
        statusbar-page-percent = true;
        selection-clipboard = "clipboard";

        extraConfig = "unmap <Space>";

        mappings = {
            "<Space>" = "exec zathura-keys"; # kitty shell script to launch zathura-cheatsheet
            "<C-Space>" = "scroll full-down";
        };
    };
}
