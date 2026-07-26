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
        wowup-cf
        opencode
        mcp-nixos
  ];

  xdg.enable = true;
}
