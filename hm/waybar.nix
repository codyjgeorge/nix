{ config, pkgs, ... }:

{
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				height = 30;
				spacing = 4;

			    ### order of the modules ###

				modules-left = [
					"ext/workspaces"
					"custom/sep"
					"ext/window"
					"custom/sep"
				];

				modules-center = [];

				modules-right = [
					"custom/sep"
					"network"
					"custom/sep"
					"cpu"
					"custom/sep"
					"memory"
					"custom/sep"
					"disk"
					"custom/sep"
					"clock"
					"custom/sep"
					"tray"
				];

			    ### module configuration ###

				"ext/workspaces" = {
					disable-scroll = true;
					all-outputs = true;
					warp-on-scroll = false;
					format = "{name}";
					persistent-workspaces = {
						"*" = 9;
					};
				};

				"ext/window" = {
					max-length = 40;
					separate-outputs = false;
				};

				"tray" = {
					# icon-size = 21;
					# icons = {};
					spacing = 10;
				};

				"clock" = {
					format-alt = "{:%Y-%m-%d}";
				};

				"cpu" = {
					format = "CPU: {usage}%";
				};

				"memory" = {
					format = "Mem: {used}GiB";
				};

				"disk" = {
					interval = 60;
					path = "/";
					format = "Disk: {free}";
				};

				"network" = {
					format = "Online";
					format-disconnected = "Offline";
				};

				"custom/sep" = {
					format = "|";
					interval = 0;
				};
			};
		};

	    ### CSS for waybar ###

		style = ''
			@define-color bg    #1a1b26;
			@define-color fg    #a9b1d6;
			@define-color blk   #32344a;
			@define-color red   #f16c75;
			@define-color grn   #2dcc82;
			@define-color ylw   #ccd663;
			@define-color blu   #7081d0;
			@define-color mag   #d154a1;
			@define-color cyn   #04d1f9;
			@define-color brblk #444b6a;
			@define-color white #ffffff;
			
			* {
				font-family: "JetBrainsMono Nerd Font", monospace;
				font-size: 16px;
				font-weight: bold;	
			}

			window#waybar {
				background-color: @bg;
				color: @fg;
			}

			#workspaces button {
				padding: 0 6px;
				color: @cyn;
				background: transparent;
				border-bottom: 3px solid @bg;
			}

			#workspaces button.active {
				color: @cyn;
				border-bottom: 3px solid @bg;
			}

			#workspaces button.empty {
				color: @white;
			}

			#workspaces button.empty.active {
				color: @cyn;
				border-bottom: 3px solid @mag;
			}

			#workspaces button.urgent {
				background-color: @red;
			}

			button:hover {
				background: inherit;
				box-shadow: inset 0 -3px @white;
			}

			#clock,
			#custom-sep,
			#cpu,
			#memory,
			#disk,
			#network,
			#tray {
				padding: 0 8px;
				color: @white;
			}

			#custom-sep {
				color: @brblk;
			}

			#clock {
				color: @cyn;
				border-bottom: 4px solid @cyn;
			}

			#disk {
				color: @ylw;
				border-bottom: 4px solid @ylw;
			}

			#memory {
				color: @mag;
				border-bottom: 4px solid @mag;
			}

			#cpu {
				color: @grn;
				border-bottom: 4px solid @grn;
			}

			#network {
				color: @blu;
				border-bottom: 4px solid @blu;
			}

			#network.disconnected {
				background-color: @red;
			}

			#tray {
				background-color: @2980b9;
			}
		'';
	};
}
