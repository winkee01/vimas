" Rename current editing file
" Reference: https://vi.stackexchange.com/questions/305/how-can-i-rename-the-file-im-editing
" Plugin: https://github.com/vim-scripts/Rename2

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" map <leader>n :call RenameFile()<cr>