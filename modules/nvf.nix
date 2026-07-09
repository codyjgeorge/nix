{ config, pkgs, ... }:

{
        programs.nvf = {
                enable = true;
                settings = {
                        vim.viAlias = false;
                        vim.vimAlias = true;
                        vim.lsp = {
                                enable = true;
                        };
                        vim.clipboard = {
                                enable = true;
                                registers = "unnamedplus";
                        };
                };
        };
}
