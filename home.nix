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
    ./hm/waybar.nix
    ./hm/kitty.nix
    ./hm/hyprland.nix
    ./hm/vesktop.nix
    ./hm/zsh.nix
    ./hm/obsidian.nix

    inputs.spicetify-nix.homeManagerModules.default
    ./hm/spicetify.nix
  ];

  home.username = "cody";
  home.homeDirectory = "/home/cody";
  home.stateVersion = "26.05";

  xdg.enable = true;

}
