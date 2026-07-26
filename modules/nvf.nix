{ config, pkgs, lib, ... }:

{
        programs.nvf = {
                enable = true;
                settings = {
                        vim = {
                                startPlugins = [
                                        "snacks-nvim"
                                        "noice-nvim"
                                        "copilot-lua"
                                        "telescope"
                                        "smart-splits"
                                        "render-markdown-nvim"
                                        "precognition-nvim"
                                        "nvim-lint"
                                        "nvim-colorizer-lua"
                                        "which-key-nvim"
                                        "eldritch-nvim"
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
                                theme = {
                                        enable = true;
                                        transparent = true;
                                        name = "eldritch-nvim"; # "base16" for custom. requires all vim.theme.base16-colors to be set.
                                };
                                luaConfigRC."colorscheme" = lib.nvim.dag.entryAfter [ "startupConfigs" ] /* lua */ ''
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
                                ui = {
                                        colorizer = {
                                                enable = true;
                                        };
                                };
                                terminal = {
                                        toggleterm.enable = true;
                                };
                        };
                };
        };
}
