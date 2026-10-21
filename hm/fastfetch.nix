{ config, pkgs, lib, ... }:

{
    programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        #"title"
        #"separator"
        #"uptime"
        #"display"
        #"de"
        #"wmtheme"
        #"cursor"
        #"localip"
        #"battery"
        #"poweradapter"
        #"locale"
        #"icons"
        "host"
        "os"
        "kernel"
        "packages"
        "break"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "break"
        "wm"
        {
          type = "font";
          format = "{font1}";
        }
        "shell"
        "terminal"
        "terminalfont"
        "break"
        {
          type = "command";
          key = "Theme";
          text = ''grep -oP 'themes/\K[^.]+' /home/cody/nix/modules/stylix.nix | sed 's/^./\U&/' '';
        }
        {
            type = "colors";
            paddingLeft = 2;
            symbol = "diamond";
        }
      ];
    };
  };
}
