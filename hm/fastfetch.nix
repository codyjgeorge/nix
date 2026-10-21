{ config, pkgs, lib, ... }:

{
    programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "wmtheme"
        {
          type = "Command";
          key = "Theme";
          text = ''grep -oP 'themes/\K[^.]+' /home/cody/nix/modules/stylix.nix'';
        }
        "icons"
        {
          type = "font";
          format = "{font1}";
        }
        "cursor"
        "terminal"
        "terminalfont"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "battery"
        "poweradapter"
        "locale"
        "break"
        "colors"
      ];
    };
  };
}
