" default key mappings
" <tab>   expand trigger
" <C-j>   advance to next tabstop
" <C-k>   reverse to previous tabstop

" Use below settings to avoid conflictions with Coc.nvim
" because Coc.nvim use <C-j> to jump to next placeholder
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" In Vim, <c-n> is used for selection completion, and <TAB> is used for inserting snippets (set in UltiSnip).
" But if you think you are more accustomed to use <TAB> for auto completion (like in sublime text, vscode or other GUI-based editors), 
" and want to trigger completion with <TAB> in Vim, you can uncomment below code:

" Trigger completion with <Tab>
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ completion#trigger_completion()
"
"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction