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
        {
          type = "host";
          key = "󰇅 Host";
        }
        {
          type = "os";
          key = " OS";
        }
        {
          type = "kernel";
          key = " Kernel";
        }
        {
          type = "packages";
          key = " Packages";
        }
        "break"
        {
          type = "cpu";
          key = " CPU";
        }
        {
          type = "gpu";
          key = "󰾲 GPU";
        }
        {
          type = "memory";
          key = " Memory";
        }
        {
          type = "swap";
          key = "󰓡 Swap";
        }
        {
          type = "disk";
          key = " Disk";
        }
        "break"
        {
          type = "wm";
          key = " Window Manager";
        }
        {
          type = "font";
          key = "󰙏 Font";
          format = "{font1}";
        }
        {
          type = "shell";
          key = " Shell";
        }
        {
          type = "terminal";
          key = "󰄛 Terminal";
        }
        {
          type = "terminalfont";
          key = "󰙏 Terminal Font";
        }
        "break"
        {
          type = "command";
          key = " Theme";
          text = ''grep -oP 'themes/\K[^.]+' /home/cody/nix/modules/stylix.nix | sed 's/^./\U&/' '';
        }
        {
            type = "colors";
            symbol = "circle";
        }
      ];
    };
  };
}
