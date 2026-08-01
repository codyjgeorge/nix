{ config, lib, pkgs, ... }:

{
    # Per-host settings for nuc-nixos
    # networking.hostName is set automatically from the flake attribute name.
    
    boot.loader = {
        systemd-boot = {
            enable = true;
            configurationLimit = 10;
        };
        efi.canTouchEfiVariables = true;
    };
    boot.kernelParams = [
        "i915.enable_psr=0"
        "i915.enable_fbc=0"
        "i915.enable_dc=0"
    ];
    
    system.stateVersion = "26.05"; # NEVER CHANGE THIS VERSION NUMBER

    time.timeZone = "Europe/Warsaw";
}
