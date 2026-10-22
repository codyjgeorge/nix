{ config, pkgs, lib, ... }:

let

  # number of "─" characters in the top/separator/bottom lines.
  inner = 68;

  # a list containing n copies of "─" and concatenates into one string "─────"
  borderLine = n: lib.concatStrings (lib.replicate n "─");

  # indent 2 spaces on string s
  indent = s: "  " + s;

  top = "╭${borderLine inner}╮";
  bottom = "╰${borderLine inner}╯";
  separator = "├${borderLine (inner - 2)}┤";

in
{
    programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "  "; # changes ":" after 'key: value' to 'key  value'
        key.width = 21;
      };
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
          key = indent "󰇅 Host";
        }
        {
          type = "os";
          key = indent " OS";
        }
        {
          type = "kernel";
          key = indent " Kernel";
        }
        {
          type = "packages";
          key = indent " Packages";
        }
        {
          type = "custom";
          format = separator; # separator border
        }
        {
          type = "cpu";
          key = indent " CPU";
        }
        {
          type = "gpu";
          key = indent "󰾲 GPU";
        }
        {
          type = "memory";
          key = indent " Memory";
        }
        {
          type = "swap";
          key = indent "󰓡 Swap";
        }
        {
          type = "disk";
          key = indent " Disk";
        }
        {
          type = "custom";
          format = separator; # separator border
        }
        {
          type = "wm";
          key = indent " Window Manager";
        }
        {
          type = "font";
          key = indent "󰙏 Font";
          format = "{font1}";
        }
        {
          type = "shell";
          key = indent " Shell";
        }
        {
          type = "terminal";
          key = indent "󰄛 Terminal";
        }
        {
          type = "terminalfont";
          key = indent "󰙏 Terminal Font";
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
            #paddingLeft = 2;
        }
      ];
    };
  };
}
