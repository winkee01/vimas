" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"

" Automatically get signature/type info for object under cursor
" let g:go_auto_type_info = 1

" let g:go_def_mapping_enabled = 0

" if we have installed gopls, uncomment below lines to enable vim-go to use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Enabled by default
let g:go_gopls_deep_completion = 1
let g:go_gopls_fuzzy_matching = 1

" disable information message
let g:go_gopls_enabled = 0
let g:go_echo_command_info = 0
let g:go_version_warning = 0


" function! NormalStatusline()
"     " emulate 'ruler'
"     let l:statusline=''
"     if exists('*fugitive#statusline')
"         let l:statusline = '%{fugitive#statusline()} '
"     endif
"
"     let l:statusline .= '%<%f %h%w%m%r'
"     if &filetype == 'go' && exists('*go#statusline#Show')
"         let l:statusline .= '%#goStatusLineColor#%{go#statusline#Show()}%*'
"     endif
"     let l:statusline .= '%=%-14.(%l,%c%V%) %P'
"
"     return l:statusline
" endfunction
"
" set statusline=%!NormalStatusline()
