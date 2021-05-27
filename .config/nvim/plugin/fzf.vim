command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" prioritize course-enroll/course-enroll.tsx

"nmap <Leader>on :Files common/containers<CR>
"nmap <Leader>om :Files mobile/src/components<CR>
"nmap <Leader>oa :Files common/actions<CR>
"nmap <Leader>or :Files common/reducers<CR>
"nmap <Leader>ot :Files common/__test__<CR>


" active fzf fzf
"nmap , :Files<CR>
"nmap ü :Buffers<CR>
"nmap <Leader>a :Rg<CR>
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
"nmap <leader>c :Commands<cr>
" fuzzy find lines in the current file
"nmap <leader>/ :BLines<cr>

"nmap , :Telescope find_files<CR>
"nmap ü :Telescope buffers<CR>
"nmap <Leader>a :Telescope live_grep<CR>

"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
