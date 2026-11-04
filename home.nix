{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hm/git.nix
    ./hm/github.nix
    ./hm/kitty.nix
    ./hm/hyprland.nix
    ./hm/vesktop.nix
    ./hm/zsh.nix
    ./hm/opencode.nix
    ./hm/mcp-nixos.nix
    ./hm/curseforge.nix
    ./hm/stylix.nix
    ./hm/fastfetch.nix
    ./hm/zathura.nix

    inputs.spicetify-nix.homeManagerModules.default
    ./hm/spicetify.nix

    inputs.noctalia.homeModules.default
    ./hm/noctalia.nix
  ];

  home.username = "cody";
  home.homeDirectory = "/home/cody";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
        obsidian
        opencode
        mcp-nixos
        godot
        devenv
        zathura-keys
  ];

  xdg.enable = true;
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}
