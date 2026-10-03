{ config, pkgs, lib, ... }:

{
	programs.kitty = {
		enable = true;
		themeFile = "Eldritch-dark";
		font = {
			name = lib.mkDefault "JetBrainsMono Nerd Font Mono";
			size = lib.mkDefault 14;
		};
		settings = {
			background_opacity = lib.mkDefault 0.80;

            # Cursor
            cursor_trail = 3;
            
            # Shaders
            custom_shaders = "cursor-trail-blaze";
		};
        extraConfig = ''
            cursor_trail_color = "#37f499";
            cursor_trail_color_accent = "#04d1f9";
        '';
	};
}
