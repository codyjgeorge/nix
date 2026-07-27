{ config, pkgs, inputs, ... }:

{
    programs.noctalia = {
        enable = true;

        settings = {
            theme = {
                mode = "dark";
                source = "builtin";
                builtin = "Eldritch";
            };

            wallpaper = {
                enable = true;
                default.path = "./wallpapers/hyprland_anime.jpg";
            };
        };
    };
}
