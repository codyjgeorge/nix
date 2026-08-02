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
                                        width = 36;
                                        pane_gap = 2;
                                        sections = [
                                            # This Centers the ASCII Art
                                            (lib.mkLuaInline ''function(self)
                                               return {
                                                 header = self.opts.preset.header,
                                                 padding = 0,
                                                 render = function(layout, pos)
                                                   local header = layout.opts.preset.header
                                                   if type(header) ~= "string" or header == "" then return end
                                                   local art = vim.split(header, "\n", { plain = true, trimempty = true })
                                                   local total = #layout.panes * layout.opts.width
                                                     + math.max(#layout.panes - 1, 0) * layout.opts.pane_gap
                                                    local starts = {}
                                                    for i, line in ipairs(art) do
                                                      local row = pos[1] + i - 1
                                                      local prev_len = #(layout.lines[row] or "")
                                                      local len = vim.api.nvim_strwidth(line)
                                                      local pad = math.max(math.floor((total - len) / 2), 0)
                                                      local new = string.rep(" ", layout.col + pad) .. line
                                                      if #new < prev_len then
                                                        new = new .. string.rep(" ", prev_len - #new)
                                                      end
                                                      layout.lines[row] = new
                                                      starts[i] = #new - #line
                                                    end
                                                    vim.schedule(function()
                                                      if not vim.api.nvim_buf_is_valid(layout.buf) then return end
                                                      local ns = require("snacks.dashboard").ns
                                                      local row0 = pos[1] - 1
                                                      vim.api.nvim_buf_clear_namespace(layout.buf, ns, row0, row0 + #art)
                                                      for i = 1, #art do
                                                        local line = (vim.api.nvim_buf_get_lines(layout.buf, row0 + i - 1, row0 + i, false) or { "" })[1] or ""
                                                        local s = math.min(starts[i], #line)
                                                        vim.api.nvim_buf_set_extmark(layout.buf, ns, row0 + i - 1, s, { hl_group = "SnacksDashboardHeader", end_col = #line })
                                                      end
                                                    end)
                                                 end,
                                               }
                                             end'')
                                            { 
                                              section = "keys"; 
                                              gap = 1; 
                                              padding = [ 1 2 ]; 
                                            }
                                            { 
                                              pane = 2;
                                              icon = " ";
                                              title = "Recent Files";
                                              section = "recent_files";
                                              indent = 2;
                                              padding = [ 1 8 ];
                                              limit = 8;
                                            }
                                            { 
                                              pane = 2;
                                              icon = " ";
                                              title = "Projects";
                                              section = "projects";
                                              indent = 2;
                                              padding = 1;
                                            }
                                            {
                                              pane = 2;
                                              section = "terminal";
                                              icon = " ";
                                              title = "Git Status";
                                              cmd = "git status --short --branch --renames";
                                              enabled = lib.mkLuaInline "function() return Snacks.git.get_root() ~= nil end";
                                              height = 5;
                                              padding = 1;
                                              indent = 3;
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
