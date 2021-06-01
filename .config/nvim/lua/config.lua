local api = vim.api
local actions = require('telescope.actions')

-- Tree-sitter {{{

require'nvim-treesitter.configs'.setup {
  -- one of "all", "language", or a list of languages
  ensure_installed = "javascript", "typescript", "tsx", "css", "html", "graphql", "json",
  highlight = {
    enable = true,                -- false will disable the whole extension
    use_languagetree = true,
  },
}

-- }}}

-- Telescope {{{

api.nvim_set_keymap("n", ",", "<cmd>Telescope find_files theme=get_dropdown<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "ü", "<cmd>Telescope buffers theme=get_dropdown sort_lastused=true<CR>", { noremap = true, silent = true })
--api.nvim_set_keymap("n", "<Leader>f", "<cmd>Telescope live_grep theme=get_dropdown<CR>", { noremap = true, silent = true })

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  }
}

-- }}}

-- https://github.com/lukas-reineke/indent-blankline.nvim {{{

vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "defx",
  "vimwiki",
  "man",
  "gitmessengerpopup",
  "diagnosticpopup"
}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_strict_tabs = true
vim.g.indent_blankline_debug = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
  "class",
  "function",
  "method",
  "^if",
  "while",
  "jsx_element",
  "jsx_self_closing_element",
  "for",
  "with",
  "func_literal",
  "block",
  "try",
  "except",
  "argument_list",
  "object",
  "dictionary"
}

-- }}}
