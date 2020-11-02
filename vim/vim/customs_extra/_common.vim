" set t_Co=256
" set t_ut=
"let base16colorspace=256
colorscheme molokai
set background=dark

" Enter the directory of current opened file
command! CDC cd %:p:h
autocmd FileType text,markdown,tex setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal textwidth=80

" Nerd Fonts
set guifont=Hack_Regular_Nerd_Font_Complete_Mono:11

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
