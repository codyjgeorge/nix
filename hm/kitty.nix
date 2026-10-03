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

    # Overrides the shipped cursor-trail-blaze.pipeline (kitty resolves the
      # config-dir one first) to recolor the trail via its static const vars.
      home.file.".config/kitty/shaders/cursor-trail-blaze.pipeline".text =
        ''
          # Eldritch colors baked in linear RGB (kitty shaders run in linear space).
          # TRAIL_COLOR = Great Old One Green #37f499 (matches theme cursor)
          # TRAIL_COLOR_ACCENT = Watery Tomb Blue #04d1f9
          startgroup
              var float4 TRAIL_COLOR = float4(0.0382, 0.9047, 0.3185, 1.0)
              var float4 TRAIL_COLOR_ACCENT = float4(0.0012, 0.6376, 0.9473, 1.0)
              animation_start cursor-trail-move
              animation_stop cursor-trail-stop
              shaders cursor-trail-blaze
          endgroup
        '';
}
