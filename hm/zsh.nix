{config, pkgs, ... }:

{
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

            initExtra = ''
              fastfetch
            '';

            shellAliases = {
              btw = "echo I use nixos, btw";
              dots = "cd ~/nix"
              arise = "sudo nixos-rebuild switch --flake ~/nix#nuc-nixos";
            };

            profileExtra = ''
                if [ -z "WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                        exec start-hyprland
                fi
            '';

            history.size = 10000;
            history.ignoreAllDups = true;
            history.path = "$HOME/.zsh_history";
            history.ignorePatterns = ["rm *" "pkill *" "cp *"];

            oh-my-zsh = {
                enable = true;
                plugins = [
                    "git"
                ];
                theme = "robbyrussell";
            };
        };
}
