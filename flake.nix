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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpgs.follows = "nixpkgs";
    };
  };
}

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nvf,
      spicetify-nix,
      ...
    }:
    {
      nixosConfigurations.nuc-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./configuration.nix

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
        ];
      };
    };
}
