{config, pkgs, ... }:

{
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

            initContent = ''
              fastfetch
            '';

            shellAliases = {
              btw = "echo I use nixos, btw";
              dots = "cd ~/nix";
              arise = "nh os switch"; 
            };

            history.size = 10000;
            history.ignoreAllDups = true;
            history.path = "$HOME/.zsh_history";
            history.ignorePatterns = ["rm *" "pkill *" "cp *"];

            oh-my-zsh = {
                enable = true;
                plugins = [
                    "git"
                ];
                theme = "philips";
            };
        };
}
