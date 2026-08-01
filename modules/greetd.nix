{ config, lib, pkgs, inputs, ... }:

{
    programs.noctalia-greeter = {
        enable = true;

        settings = {
            session = {
                default = "Hyprland";
            };
            user = {
                default = "cody";
            };
            appearance = {
                scheme = "Synced";
                theme_mode = "dark";
                password_style = "random";
                palette = {
                  primary            = "#9BFECE";
                  on_primary         = "#282640";
                  secondary          = "#a8aefe";
                  on_secondary       = "#282640";
                  tertiary           = "#bc7ff0";
                  on_tertiary        = "#282640";
                  error              = "#f9a2ad";
                  on_error           = "#282640";
                  surface            = "#282640";
                  on_surface         = "#f3edf7";
                  surface_variant    = "#3b3750";
                  on_surface_variant = "#c3b7dd";
                  outline            = "#4d486d";
                  shadow             = "#000000";
                  hover              = "#a8aefe";
                  on_hover           = "#282640";
                };
                wallpaper = {
                    path = ../wallpapers/hyprland_anime.jpg;
                    fill_mode = "crop";
                };
            };
            keyboard = {
                layout = "us";
                numlock = true;
            };
            idle = {
                timeout = 300;
            };
        };
    };
}
