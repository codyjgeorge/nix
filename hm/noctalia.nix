{ config, pkgs, inputs, ... }:

{
    programs.noctalia = {
        enable = true;

        settings = {
            theme = {
                mode = "dark";
                source = "builtin";
                builtin = "Catpuccin";
            };

            wallpaper = {
                enable = true;
                default.path = "./wallpapers/nixOS.png";
            };
        };
    };
}
