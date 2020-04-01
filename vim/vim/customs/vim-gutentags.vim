" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" ctags filename
let g:gutentags_ctags_tagfile = '.tags'

" load ctags and gtags modules
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" put generaed ctags & gtags files into a sepreated directory
let g:gutentags_cache_dir = expand('~/.cache/tags')

" options for ctags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args = ['--options='. expand('~/.ctags')]

" add this line if using universal ctags
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

" disable auto-load gtags-cscope db
let g:gutentags_auto_add_gtags_cscope = 1

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

"let g:gutentags_trace = 1
"let g:gen_tags#verbose = 1

"Enable two advanced commands: GutentagsToggleEnabled and GutentagsToggleTrace
"let g:gutentags_define_advanced_commands = 1

" default is []
" let g:gutentags_exclude_filetypes = [text]

" default is /usr/local
" let g:gutentags_exclude_project_root = ['/usr/local']

" let g:gutentags_ctags_exclude = [
"       \ 'vendor',
"       \ 'Makefile',
"       \ ]

command! -nargs=0 GutentagsClearCache call system('rm -rf' . g:gutentags_cache_dir . '/*')