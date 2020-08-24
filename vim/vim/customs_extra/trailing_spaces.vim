" automatically remove all trailing spaces on :w
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * :call TrimWhitespace()


" Restrict effects to specific filetypes
autocmd FileType c,cpp,java,php autocmd BufWritePre * :call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

" winsaveview() and winrestview() are used to save and restore window state (e.g. cursor position)
" before any actions

" Reference: https://vim.fandom.com/wiki/Remove_unwanted_spaces

" Be aware:
" If you use Vim and other editors to edit the same file at the same time, 
" you may experience conflicts while they have different truncating policies.
" for example, you set truncating trailing whitespaces in vim for specific types on save, 
" but you also edit this file in Sublime Text or other editors, which will truncate whitespaces for all file types,
" then you get differents effects.