command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nmap , :Files<CR>
"nmap <Leader>on :Files common/containers<CR>
"nmap <Leader>om :Files mobile/src/components<CR>
"nmap <Leader>oa :Files common/actions<CR>
"nmap <Leader>or :Files common/reducers<CR>
"nmap <Leader>ot :Files common/__test__<CR>
nmap ü :Buffers<CR>
nmap <Leader>a :Rg<CR>

" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<cr>
" fuzzy find lines in the current file
nmap <leader>/ :BLines<cr>
