"vim-autoformat ships default formatters for many language including:
" C, C++, Objective C, Python, Golang, Java, Javascript, Typescript,
" JSON, HTML, Ruby, CSS/SCSS/Less, Shell, Ocaml, etc.

" Autoformat command
" noremap <F3> :Autoformat<CR>

" automatically execute upon save
au BufWrite * :Autoformat


" Golang
" vim-autoformat use gofmt and goimports for default formatting and auto importing
" the default settings are as below:
" let g:formatdef_gofmt_1 = '"gofmt -tabs=".(&expandtab ? "false" : "true")." -tabwidth=".shiftwidth()'
" let g:formatdef_gofmt_2 = '"gofmt"'
" let g:formatdef_goimports = '"goimports"'

autocmd FileType markdown,tex,javascript,python,yaml let b:autoformat_autoindent=0
