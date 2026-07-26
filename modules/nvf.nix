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
                                        "which-key-nvim"
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
                                        name = "base16"; # "base16" for custom. requires all vim.theme.base16-colors to be set.
                                        base16-colors = {
                                            # UI and Background Elements
                                                base00 = "#212337"; #Main Background
                                                base01 = "#323449"; #Statusline/Panel Background
                                                base02 = "#454759"; #Selection Highlight
                                                base03 = "#5b5c66"; #Comments/Line Numbers
                                                base04 = "#ebfafa"; #Subtle Text
                                                base05 = "#7081d0"; #Main Code Text/Foreground
                                                base06 = "#04d1f9"; #Bright UI Highlight
                                                base07 = "#37f499"; #Active Cursor/Special Highlight
                                            # Syntax Highlighting Elements
                                                base08 = "#f7c67f"; #Errors/Variables
                                                base09 = "#f265b5"; #Integers, Booleans, Constants
                                                base0A = "#a48cf2"; #Types/Classes
                                                base0B = "#f1fc79"; #Strings
                                                base0C = "#f16c75"; #Regex/Escapes
                                                base0D = "#7081d0"; #Functions/Methods
                                                base0E = "#a48cf2"; #Keywords/Control Flow
                                                base0F = "#f265b5"; #Delimiters/Special Tags
                                        };
                                };
                                extraLuaConfig = ''
                                    local function clear_bg()
                                        vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
                                        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"} )
                                        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
                                        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
                                    end

                                    --Run whenever colorsceme changes
                                    clear_bg()
                                    vim.api.nvim_create_autocmd("ColorScheme", {
                                        pattern = "*",
                                        callback = clear_bg,
                                    })
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
