{
  description = "NixOS flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eldritch-nvim = {
        url = "github:eldritch-theme/eldritch.nvim";
        flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nvf,
      spicetify-nix,
      eldritch-nvim,
      nh,
      stylix,
      ...
    }:
    let
        mkHost = name: system:
            nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                    ./hosts/${name}/hardware-configuration.nix
                    ./hosts/${name}/default.nix
                    ({ ... }: { networking.hostName = name; })

                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.cody = import ./home.nix;
                            extraSpecialArgs = { inherit inputs; };
                            backupFileExtension = "backup";
                        };
                    }

                    nvf.nixosModules.default
                    ./modules/nvf.nix

                    ./modules/steam.nix

                    ./modules/overlays.nix

                    inputs.noctalia.nixosModules.default

                    ./modules/nh.nix

                    stylix.nixosModules.stylix
                    ./modules/stylix.nix
                ];
            };
    in
    {
        nixosConfigurations = {
            nuc-nixos = mkHost "nuc-nixos" "x86_64-linux";
            # other-pc = mkHost "other-pc" "x86_64-linux"; -- make hosts/other-pc/ folder
        };
    };
}
