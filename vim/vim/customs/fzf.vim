

" File Finder
nnoremap <Leader>d :Files<CR>
nmap <Leader>D :Files<CR>

nmap<Leader>p :ProjectFiles<CR>

" modify a sibling file in the same directory
" same as :Files
nnoremap <silent> <Leader>v :Files <C-r>=expand("%:h")<CR>/<CR>

" Buffer Finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" Tag Finder
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" Line Finder
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

" Project Finder
nmap <Leader>/ :Ag<Space>
nmap <Leader>/ :Rg<Space>

" Help Finder
nmap <Leader>H :Helptags!<CR>

" Search Commands
nmap <Leader>C :Commands<CR>

" Search through :command history
nmap <Leader>: :History:<CR>

" Search key mappings
nmap <Leader>M :Maps<CR>

" Search filetype syntaxs
" nmap <Leader>s :Filetypes<CR>

" Loop select by Ctrl-j/k
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" export FZF_DEFAULT_COMMAND='ag -u -g ""'
" export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


command! FZFInsert call fzf#run({'sink': function('<sid>insert_sink')})




