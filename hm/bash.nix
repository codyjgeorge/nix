{ config, pkgs, ... }:

{ 
	programs.bash = {
		enable = true;
		initExtra = ''
			fastfetch
		'';
		shellAliases = {
			btw = "echo I use nixos, btw";
			arise = "sudo nixos-rebuild switch --flake ~/nix#nuc-nixos";
			dots = "cd ~/nix";
		};
    		profileExtra = ''
      			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        			exec start-hyprland
      			fi
    		'';
	};
}
