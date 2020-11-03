" In Vim, <C-N> is used selection completion, and <TAB> is used for inserting snippets.
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