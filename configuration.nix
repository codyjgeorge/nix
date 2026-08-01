{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
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

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        # "https://cache.garnix.io" --Shutdown May2026, possible community-run/self-hosted project coming
        # "https://hyprland.cachix.org"
        "https://noctalia.cachix.org"
      ];
      trusted-substituters = [
        # Official nix cache
        "https://cache.nixos.org"
        # Garnix --Shutdown May2026, possible community-run/self-hosted project coming
        # "https://cache.garnix.io" 
        # Nix Community Cache
        "https://nix-community.cachix.org"
        # hyprland cache
        # "https://hyprland.cachix.org"
        # Personal Cachix cache
        # Noctalia
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        # Official nix cache
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        # Personal Cachix cache
        # Garnix --Shutdown May2026, possible community-run/self-hosted project coming
        # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        # Nix community cache
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        # hyprland cache
        # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        # Noctalia
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      allowed-users = [
        "root"
        "@wheel"
      ];
    };
  };

  nixpkgs = {
        config = {
                allowUnfree = true;
        };
  };

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  networking.hostName = "Nuc";

  time.timeZone = "Europe/Warsaw";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable PipeWire & Wireplumber for audio/video stream routing
  security.rtkit.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
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
    shell = pkgs.zsh;
  };

  programs = {
        
        zsh.enable = true;

        firefox.enable = true;

        hyprland = {
            enable = true;
            xwayland.enable = true;
        };

        noctalia = {
            enable = true;
            recommendedServices.enable = true;
        };
  };

  # Configure XDG Desktop Portals specifically for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
    ];
    config = {
        common.default = [ "gtk" ];
        hyprland.default = [ "hyprland" "gtk" ];
    };
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    gcc
    vim
    wget
    git
    zsh
    kitty
    fastfetch
    grim
    slurp
    satty
    wayfreeze
    wl-clipboard
    kdePackages.dolphin
    curl
    nh
    nix-output-monitor

  ];

  environment.sessionVariables = {
        QT_QPA_PLATFORM = "wayland";
        NIXOS_OZONE_WL = "1";
        NIXPKGS_ALLOW_UNFREE = "1";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
  };

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
