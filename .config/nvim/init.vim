source ~/.config/nvim/vim/basics.vim


lua << EOF
require('plugins')
require('config')
require('lsp')
require('format')
EOF
