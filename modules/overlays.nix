{ config, lib, pkgs, inputs, ... }:

{
      nixpkgs = {
        overlays = [

          inputs.nh.overlays.default

        ];
      };

}
