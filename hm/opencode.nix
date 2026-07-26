{ config, pkgs, inputs, ... }:

{
    programs = {
        opencode = {
            enable = true;
            enableMcpIntegration = true;

            settings = {
                default_agent = "build";

                permission = {
                    external_directory = "ask";
                    bash = {
                        "git commit*" = "ask";
                        "git pull*" = "ask";
                        "git merge*" = "ask";
                        "git push*" = "ask";
                        "git reset*" = "ask";
                        "git clean*" = "ask";
                        "git branch -D*" = "ask";
                        "git checkout --*" = "ask";
                        "git restore*" = "ask";
                        "git rebase*" = "ask";
                        "git commit --amend*" = "ask";
                    };
                };

                tools.websearch = true;
                small_model = "opencode/big-pickle";
                share = "disabled";
            };
            tui = {
                scroll_speed = 3;
                scroll_acceleration = {
                    enabled = true;
                };
                diff_style = true;
            };
        };
        zsh.initContent = "alias oc=opencode";
    };
}
