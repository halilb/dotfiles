-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Editing
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- Substition with respect to case:
  -- :%s/facility/building/g
  -- https://github.com/tpope/vim-abolish
  use 'tpope/vim-abolish'

  -- Github copilot
  use 'github/copilot.vim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  --use 'airblade/vim-gitgutter'
  use 'junegunn/gv.vim'

  -- Project navigation
  use 'mileszs/ack.vim'
  use 'mcchrish/nnn.vim'

  -- colors
  use 'morhetz/gruvbox'
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- telescope and dependencies
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- indentation lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Linter
  use 'w0rp/ale'

  -- File navigation
  use 'easymotion/vim-easymotion'
  use 'kshenoy/vim-signature'
  use 'haya14busa/incsearch.vim'

  -- use 'zxqfl/tabnine-vim'
  --use 'neoclide/coc.nvim', {'branch': 'release'}

  -- easier tesing
  use 'janko/vim-test'

  -- tmux nav
  use 'christoomey/vim-tmux-navigator'

  -- UI
  use 'vim-airline/vim-airline'

  -- Snippets
  use 'honza/vim-snippets'

end)
