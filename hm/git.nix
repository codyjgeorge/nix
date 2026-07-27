{ config, pkgs, ... }:

{ 
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "codyjgeorge";
				email = "codygeorge315@gmail.com";
			};
		};
	};
}
