{ config, pkgs, lib, ... }:

{
    programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        #"title"
        #"separator"
        "os"
        "host"
        "kernel"
        #"uptime"
        "packages"
        "shell"
        #"display"
        #"de"
        "wm"
        #"wmtheme"
        {
          type = "command";
          key = "Theme";
          text = ''grep -oP 'themes/\K[^.]+' /home/cody/nix/modules/stylix.nix | sed 's/^./\U&/' '';
        }
        "icons"
        {
          type = "font";
          format = "{font1}";
        }
        #"cursor"
        "terminal"
        "terminalfont"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        #"localip"
        #"battery"
        #"poweradapter"
        #"locale"
        "break"
        {
            type = "colors";
            paddingLeft = 6;
            symbol = "star";
        }
      ];
    };
  };
}
