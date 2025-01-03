require("pranay.set")
require("pranay.remap")
local augroup = vim.api.nvim_create_augroup
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"text", "markdown", "plain"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 100
        vim.opt_local.colorcolumn = "100"
    end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "README*",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.colorcolumn = "100"
    end,
})


local myGroup = augroup('myGroup', {})
require("nvim-tree").setup()

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = myGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


vim.cmd[[set termguicolors background=dark]]

require("autoclose").setup({
   keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },

      [">"] = { escape = true, close = false, pair = "<>" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },

      ['"'] = { escape = true, close = true, pair = '""' },
      ["'"] = { escape = true, close = true, pair = "''" },
      ["`"] = { escape = true, close = true, pair = "``" },
   },
   options = {
      disabled_filetypes = { "text", "markdown" },
      disable_when_touch = false,
      touch_regex = "[%w(%[{]",
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = false,
   },
})


-- Default options:

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'no-clown-fiesta',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


-- Utilities for creating configurations
local util = require "formatter.util"


-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- copilot
vim.g.copilot_enabled = false


require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "ts_ls", -- For TypeScript and JavaScript
        "pyright",                    -- Example for Python
        "lua_ls",                     -- Example for Lua
    }
}

require("lspconfig").ts_ls.setup {
    on_attach = function(client, bufnr)
        -- Custom keybindings and logic for LSP here
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
}

require('lsp-zero')
require('lspconfig').lua_ls.setup({})
require("no-clown-fiesta").setup({
  transparent = false, -- Enable this to disable the bg color
  styles = {
    -- You can set any of the style values specified for `:h nvim_set_hl`
    comments = {italic = true},
    keywords = {bold = false},
    functions = {bold = false},
    variables = {},
    strings = {italic = true},
    type = { bold = true },
    lsp = { underline = false}
  },
})
vim.cmd.colorscheme("no-clown-fiesta")
