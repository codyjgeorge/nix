{ config, pkgs, lib, ... }:

let

  # number of "─" characters in the top/separator/bottom lines.
  inner = 48;

  # a list containing n copies of "─" and concatenates into one string "─────"
  borderLine = n: lib.concatStrings (lib.replicate n "─");

  top = "╭${borderLine inner}╮";
  bottom = "╰${borderLine inner}╯";
  separator = "|-${borderLine (inner - 2)}-|";

in
{
    programs.fastfetch = {
    enable = true;
    settings = {
      display.separator = "  "; # changes ":" after 'key: value' to 'key  value' 
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
          type = "custom";
          format = top; # top border
        }
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
        {
          type = "custom";
          format = separator; # separator border
        }
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
        {
          type = "custom";
          format = separator; # separator border
        }
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
        {
          type = "custom";
          format = bottom; # bottom border
        }
        {
          type = "command";
          key = " Theme";
          text = ''grep -oP 'themes/\K[^.]+' /home/cody/nix/modules/stylix.nix | sed 's/^./\U&/' '';
        }
        {
            type = "colors";
            symbol = "circle";
            leftPadding = 2;
        }
      ];
    };
  };
}
