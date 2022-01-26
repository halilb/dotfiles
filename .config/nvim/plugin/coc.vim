"set signcolumn=yes

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"" Use `ğg` and `şg` to navigate diagnostics
"nmap <silent> şg <Plug>(coc-diagnostic-prev)
"nmap <silent> ğg <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" use enter for applying multi word suggestion
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           "\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"" snippets
"" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'

"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
"nmap <F2> <Plug>(coc-rename)

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
