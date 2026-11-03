{ config, pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  nixAgent = inputs.nix-agent.packages.${system}.default;
in
{
    programs.mcp = {
        enable = true;
        servers = {
            mcp-nixos = {
                command = "nix";
                args = [
                    "run"
                    "github:utensils/mcp-nixos"
                    "--"
                ];
            };
            nix-agent = {
                command = "${nixAgent}/bin/nix-agent";
                args = [ ];
                env = {
                  NIX_AGENT_FLAKE = "/home/cody/nix";
                };
            };
        };
    };
}
