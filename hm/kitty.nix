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
	};
}
