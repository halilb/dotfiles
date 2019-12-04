let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'html': []
\  }

"let g:ale_linter_aliases = {
"\  'typescript.tsx': 'typescript',
"\  'typescriptreact': 'typescript'
"\  }


" 'javascript': ['prettier', 'eslint'],
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': [],
\   'typescriptreact': []
\   }

nmap <leader>d <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
"hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
"hi ALEWarningSign guifg=#F2C38F

" Use ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
