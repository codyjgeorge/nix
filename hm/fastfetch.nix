{ config, pkgs, lib, ... }:

let

  # number of "─" characters in bottom border
  inner = 71;

  # eldritch colors
  eldPurple = "#a48cf2";
  eldGreen  = "#37f499";
  eldBlue   = "#39ddfd";
  eldYellow = "#f1fc79";

  # inline-color helper
  # makeColor eldYellow -> {##f1fc79}
  makeColor = c: "{#${c}}";

  # a list containing n copies of "─" and concatenates into one string "─────"
  borderLine = n: lib.concatStrings (lib.replicate n "─");

  # indent 2 spaces on string s
  indent = s: "  " + s;

  top        = "╭${borderLine 32} ${makeColor eldPurple}STUFF${makeColor eldBlue} ${borderLine 32}╮";
  separator1 = "├${borderLine 32} ${makeColor eldPurple}THINGS${makeColor eldBlue} ${borderLine 31}┤";
  separator2 = "├${borderLine 27} ${makeColor eldPurple}STUFF and THINGS${makeColor eldBlue} ${borderLine 26}┤";
  bottom     = "╰${borderLine inner}╯";

in
{
    programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "  "; # changes ":" after 'key: value' to 'key  value'
        key.width = 21;
        color = {
          keys = eldPurple;
          output = eldGreen;
        };
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
          outputColor = eldBlue;
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
          format = separator1; # separator1 border
          outputColor = eldBlue;
        }
        {
          type = "cpu";
          key = indent " CPU";
          format = "{name} ({cores-logical}) @ ${makeColor eldYellow}{freq-max}${makeColor eldGreen}";
        }
        {
          type = "gpu";
          key = indent "󰾲 GPU";
          format = "{name} @ ${makeColor eldYellow}{freq-max}${makeColor eldGreen}[{type}]";
        }
        {
          type = "memory";
          key = indent " Memory";
          percent.type = [ "num" ];
          format = "{used} / {total} (${makeColor eldYellow}{percentage}${makeColor eldGreen})";
        }
        {
          type = "swap";
          key = indent "󰓡 Swap";
          percent.type = [ "num" ];
          format = "{used} / {total} (${makeColor eldYellow}{percentage}${makeColor eldGreen})";

        }
        {
          type = "disk";
          key = indent " Disk";
          percent.type = [ "num" ];
          format = "{size-used} / {size-total} (${makeColor eldYellow}{size-percentage}${makeColor eldGreen}) - {filesystem}";

        }
        {
          type = "custom";
          format = separator2; # separator2 border
          outputColor = eldBlue;
        }
        {
          type = "wm";
          key = indent " Window Manager";
          format = "{pretty-name} {version} (${makeColor eldYellow}{protocol-name}${makeColor eldGreen})";
        }
        /*{
         * type = "font";
         * key = indent "󰙏 Font";
         * format = "{font1} (${makeColor eldYellow}{size}pt${makeColor eldGreen})";
        }*/
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
          format = "{name} (${makeColor eldYellow}{size}pt${makeColor eldGreen})";
        }
        {
          type = "custom";
          format = bottom; # bottom border
          outputColor = eldBlue;
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
