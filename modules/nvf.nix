{ config, pkgs, lib, inputs, ... }:
let
    userPlugins = {
        eldritch-nvim = pkgs.vimUtils.buildVimPlugin {
            name = "eldritch.nvim";
            src = inputs.eldritch-nvim;
        };
    };
in
{
        programs.nvf = {
                enable = true;
                settings = {
                        vim = { 
                                startPlugins = [
                                        "noice-nvim"
                                        "copilot-lua"
                                        "telescope"
                                        "smart-splits"
                                        "render-markdown-nvim"
                                        "precognition-nvim"
                                        "nvim-lint"
                                        "nvim-colorizer-lua"
                                        "which-key-nvim"
                                        userPlugins."eldritch-nvim"
                                ];
                                viAlias = false;
                                vimAlias = true;
                                lsp = {
                                        enable = true;
                                };
                                languages = {
                                        markdown = {
                                                enable = true;
                                                extensions.render-markdown-nvim.enable = true;
                                                format.enable = true;
                                        };
                                        nix = {
                                                enable = true;
                                                format.enable = true;
                                        };

                                        clang = {
                                                enable = true;
                                                format.enable = true;
                                                treesitter.enable = true;
                                                lsp.enable = true;
                                                dap.enable = true;
                                        };
                                };
                                clipboard = {
                                        enable = true;
                                        registers = "unnamedplus";
                                };
                                luaConfigRC."colorscheme" = inputs.nvf.lib.nvim.dag.entryAfter [ "startupConfigs" ] /* lua */ ''
                                        require("eldritch").setup({ transparent = true })
                                        vim.cmd.colorscheme("eldritch")
                                '';
                                options = {
                                        wrap = false;
                                        mouse = "a";
                                        splitright = true;
                                        tabstop = 4;
                                        autoindent = true;
                                        shiftwidth = 4;
                                };
                                utility."snacks-nvim" = {
                                    enable = true;
                                    setupOpts.dashboard = {
                                        width = 60;
                                        pane_gap = 4;
                                        row = null;
                                        col = null;
                                        sections = [
                                            { 
                                              section = "header";
                                              padding = 8;
                                            }
                                            { 
                                              section = "keys";
                                              pane = 1;
                                              gap = 1; 
                                              padding = 8; 
                                            }
                                            { 
                                              icon = " ";
                                              title = "Projects";
                                              section = "projects";
                                              pane = 2;
                                              padding = 1;
                                              limit = 3;
                                              indent = 2;
                                            }
                                            {
                                              section = "terminal";
                                              pane = 2;
                                              icon = " ";
                                              title = "Git Status";
                                              cmd = "git status --short --branch --renames";
                                              enabled = lib.mkLuaInline "function() return Snacks.git.get_root() ~= nil end";
                                              height = 1;
                                              indent = 2;
                                              padding = 1;
                                              ttl = 300;
                                            }
                                        ];
                                        preset = {
                                            header = lib.mkLuaInline ''
                                           [[  ██████╗ ██████╗ ██████╗ ██████╗ ███████╗
                                              ██╔════╝██╔═══██╗██╔══██╗╚════██╗╚══███╔╝
                                              ██║     ██║   ██║██║  ██║ █████╔╝  ███╔╝ 
                                              ██║     ██║   ██║██║  ██║ ╚═══██╗ ███╔╝  
                                              ╚██████╗╚██████╔╝██████╔╝██████╔╝███████╗
                                               ╚═════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]]'';
                                            keys = [
                                                { icon = " "; key = "f"; desc = "Find File"; action = ":lua Snacks.dashboard.pick('files')"; }
                                                { icon = " "; key = "n"; desc = "New File"; action = ":ene | startinsert"; }
                                                { icon = " "; key = "g"; desc = "Find Text"; action = ":lua Snacks.dashboard.pick('live_grep')"; }
                                                { icon = " "; key = "r"; desc = "Recent Files"; action = ":lua Snacks.dashboard.pick('oldfiles')"; }
                                                { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
                                            ];
                                        };
                                    };
                                };
                                ui = {
                                        colorizer = {
                                                enable = true;
                                        };
                                };
                                terminal = {
                                        toggleterm.enable = true;
                                };
                                keymaps = [
                                    {
                                        key = "<leader>r";
                                        mode = ["n"];
                                        action = ":w<CR>:split | term g++ % -o main && ./main<CR>";
                                        silent = true;
                                        desc = "Compile and Run C++";
                                    }
                                ];
                        };
                };
        };
}
