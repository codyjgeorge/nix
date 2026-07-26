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
