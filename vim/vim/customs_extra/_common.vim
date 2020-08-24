" set t_Co=256
" set t_ut=
"set termguicolors
"let base16colorspace=256
colorscheme github
set background=light

" Enter the directory of current opened file
command! CDC cd %:p:h
autocmd FileType text,markdown,tex setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal textwidth=80