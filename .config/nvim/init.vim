call plug#begin('~/.nvim/plugged')

" Editing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Syntax highlighting
"Plug 'scrooloose/syntastic'
"Plug 'mxw/vim-jsx'
"Plug 'jaxbot/syntastic-react'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

Plug 'rizzatti/dash.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" Project navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

" Task running
Plug 'w0rp/ale'                           " Linter

" File navigation
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'haya14busa/incsearch.vim'

" typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
" Plug 'Shougo/deoplete.nvim'

" python
"Plug 'psf/black'

" Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" floating terminal
Plug 'voldikss/vim-floaterm'

" colors
Plug 'morhetz/gruvbox'

" easier tesing
Plug 'janko/vim-test'

" tmux nav
Plug 'christoomey/vim-tmux-navigator'

" UI
Plug 'vim-airline/vim-airline'
" Plug 'ryanoasis/vim-devicons'

" Snippets
" used with coc-snippets
Plug 'honza/vim-snippets'

Plug 'jparise/vim-graphql'

call plug#end()

syntax on
syntax enable

filetype plugin on

" minimum tab size
set winwidth=100
"set winheight=40

"colors torte
"colors shine
colorscheme gruvbox

" devicons
" let g:airline_powerline_fonts = 1
" set encoding=UTF-8

" Persistent undo
" Don't forget mkdir folder $HOME/.config/nvim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000


set nu
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned
set hlsearch
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set relativenumber

set updatetime=300      " for gitgutter and coc


" prettier for coc
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"
nnoremap <Leader>s :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" new terminal
let g:floaterm_keymap_toggle = '<leader>v'

" open nvim configuration
" nmap <leader>v :e ~/.config/nvim/init.vim<CR>

" http://vim.wikia.com/wiki/Erasing_previously_entered_characters_in_insert_mode
:set backspace=2

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" use space instead of tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" use 8 spcae width tab
" set tabstop=8 softtabstop=0 noexpandtab shiftwidth=4

autocmd Filetype scss setlocal shiftwidth=2

set fileformats+=dos

set backupdir=$TMPDIR//
set directory=$TMPDIR//

" jsx
let g:jsx_ext_required = 0

let g:syntastic_always_populate_loc_list = 1

" https://github.com/tmux/tmux/issues/543#issuecomment-248980734
" set clipboard=unnamed

" set html syntacs
autocmd BufNewFile,BufRead *.hbs set syntax=html

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'Rg --vimgrep'
let $FZF_DEFAULT_COMMAND = 'rg --files'

" start of file finder
" see https://damien.pobel.fr/post/configure-neovim-vim-gf-javascript-import/
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
" end of file finder

let g:floaterm_position = 'center'

" start of fzf floating window
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(30)
  let width = float2nr(160)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" end of fzf floating window

" move to next-previous quickfix file
map <C-j> :cn<CR>
map <C-k> :cp<CR>
