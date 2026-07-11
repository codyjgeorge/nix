{ config, pkgs, ... }:

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
                                        "dracula"
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
                                };
                                clipboard = {
                                        enable = true;
                                        registers = "unnamedplus";
                                };
                                theme = {
                                        enable = true;
                                        transparent = true;
                                        name = "dracula"; # "base16" for custom. requires all vim.theme.base16-colors to be set.
                                };
                                options = {
                                        wrap = false;
                                        mouse = "a";
                                        splitright = true;
                                        tabstop = 4;
                                        autoindent = true;
                                        shiftwidth = 4;
                                };

                                ui = {
                                        noice = {
                                                enable = true;
                                        };
                                        colorizer = {
                                                enable = true;
                                        };
                                };
                                telescope = {
                                        enable = true;
                                };
                        };
                };
        };
}
