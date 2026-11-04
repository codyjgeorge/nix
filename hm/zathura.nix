{ config, lib, pkgs, ... }:

let
  cheatsheet = pkgs.writeShellScript "zathura-cheatsheet" ''
    export PATH="${lib.makeBinPath [ pkgs.man-db pkgs.util-linux pkgs.gnused pkgs.gnugrep pkgs.less ]}:$PATH"
    export MANPATH="${pkgs.zathura}/share/man''${MANPATH:+:$MANPATH}"
    {
      man zathura | col -b | sed -n "/MOUSE AND KEY BINDINGS/,/^COMMANDS/p"
      printf '\nCUSTOM MAPPINGS\n\n'
      grep "^map " "$HOME/.config/zathura/zathurarc" 2>/dev/null || true
    } | less -R
  '';

  zathura-keys = pkgs.writeShellScriptBin "zathura-keys" ''
    exec ${pkgs.kitty}/bin/kitty \
      --class zathura-cheatsheet \
      --title "Zathura keybindings" \
      -e ${cheatsheet}
  '';
in
{
  programs.zathura = {
    enable = true;
    options = {
      guioptions = "cshv";
      font = "JetBrainsMono Nerd Font 10";
      statusbar-page-percent = true;
      selection-clipboard = "clipboard";
    };
    extraConfig = "unmap <Space>";
    mappings = {
      "<Space>" = "exec zathura-keys";
      "<C-Space>" = "scroll full-down";
    };
  };

  home.packages = [ zathura-keys ];
}
