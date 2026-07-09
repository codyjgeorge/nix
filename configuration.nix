{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
        systemd-boot = {
                enable = true;
                configurationLimit = 10;
        };

        efi.canTouchEfiVariables = true;
  };

  nix = {
        gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
        };

        settings = {
               experimental-features = [ "nix-command" "flakes" ];
               auto-optimise-store = true;
        };
  };

  nixpkgs.config.allowUnfree = true;


  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  networking.hostName = "cody";

  time.timeZone = "Europe/Warsaw";

  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };

  # Video
  services.xserver.videoDrivers = [ "modesetting" ];
  # Sound
  services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
  };

  boot.kernelParams = [ 
	"i915.enable_psr=0"
	"i915.enable_fbc=0"
	"i915.enable_dc=0"
  ];

  services.getty.autologinUser = "cody";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cody = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    waybar
    kitty
    fastfetch
    hyprpaper
    hyprlauncher
    grim
    slurp
    satty
    wayfreeze
    wl-clipboard
    kdePackages.dolphin
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

