luafile $HOME/.config/nvim/lua/config.lua
lua require('plugins')

syntax on

filetype plugin on

" minimum tab size
set winwidth=100
"set winheight=40

"autocmd VimResized * wincmd =

" Theme
"colors torte
"colors shine
"colorscheme gruvbox

if (has("termguicolors"))
 set termguicolors
endif
colorscheme gruvbox

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

" substitute wasn't changing multiple occurrences in a single line
" https://vi.stackexchange.com/a/7392
set nogdefault


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

" Telescope
nnoremap <Leader>a :Telescope live_grep theme=get_dropdown<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

autocmd Filetype scss setlocal shiftwidth=2

set fileformats+=dos

set backupdir=$TMPDIR//
set directory=$TMPDIR//

" set html syntacs
autocmd BufNewFile,BufRead *.hbs set syntax=html

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'Rg --vimgrep'

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

" move to next-previous quickfix file
map <C-j> :cn<CR>
map <C-k> :cp<CR>
