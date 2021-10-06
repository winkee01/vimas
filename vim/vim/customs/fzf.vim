" File Finder
nnoremap <Leader>d :Files<CR>
nmap <Leader>D :Files<CR>

nmap<Leader>p :ProjectFiles<CR>

" modify a sibling file in the same directory
" same as :Files
" nnoremap <silent> <Leader>v :Files <C-r>=expand("%:p:h")<CR>/<CR>

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
"nmap <Leader>/ :Ag<Space>
" nmap <Leader>/ :Rg<Space>

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

" Loop select by Ctrl-p/n
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

" Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Rg
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, s:p(<bang>0), <bang>0)',
" Ag
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, s:p(<bang>0), <bang>0)',
""  return call('fzf#vim#grep', extend(['ag --nogroup --column --color '.a:command_suffix, 1], a:000))

"in ack
"let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
" command! -bang -nargs=* -complete=file Ack call ack#Ack('grep<bang>', <q-args>)


"command! FZFInsert call fzf#run({'sink': function('<sid>insert_sink')})

" this mapping is usdef for riggrep
" make sure we have installed riggrep
nnoremap <C-x> :Rg<Cr>
