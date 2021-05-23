let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:prettier#config#tab_width = 'auto'

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
"au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
au FileType css,scss,yaml let b:prettier_exec_cmd = ""