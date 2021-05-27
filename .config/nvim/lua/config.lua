local api = vim.api
local actions = require('telescope.actions')

-- Tree-sitter {{{

require'nvim-treesitter.configs'.setup {
  -- one of "all", "language", or a list of languages
  ensure_installed = "javascript", "typescript", "tsx", "css", "html", "graphql", "json",
  highlight = {
    enable = true,                -- false will disable the whole extension
  },
}

-- }}}

-- Telescope {{{

api.nvim_set_keymap("n", ",", "<cmd>Telescope find_files theme=get_dropdown<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "ü", "<cmd>Telescope buffers theme=get_dropdown<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "ff", "<cmd>Telescope live_grep theme=get_dropdown<CR>", { noremap = true, silent = true })

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

--nmap , :Telescope find_files<CR>
--nmap ü :Telescope buffers<CR>
--nmap <Leader>a :Telescope live_grep<CR>
