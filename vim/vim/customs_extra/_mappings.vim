
" ================ Mappings ==========================
" Default mapleader is \
let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>WQ :wa<CR>:q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>r :e .<CR>

inoremap <C-e> <C-o>$

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" nnoremap <c-l> :let current_win = winnr()<CR><c-w>l:if current_win == winnr() \| wincmd t \| endif<CR>

nnoremap <c-h> :let current_win = winnr()<CR><c-w>h:if current_win == winnr() \| wincmd b \| endif<CR>
nnoremap <c-j> :let current_win = winnr()<CR><c-w>j:if current_win == winnr() \| wincmd l \| endif<CR>
nnoremap <c-k> :let current_win = winnr()<CR><c-w>k:if current_win == winnr() \| wincmd r \| endif<CR>
nnoremap <c-l> :let current_win = winnr()<CR><c-w>l:if current_win == winnr() \| wincmd t \| endif<CR>

"(v)im (c)ommand - execute current line as a vim command
" nmap <silent> ,vc yy:<C-f>p<C-c><CR>

" Switching tabs
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>
" inoremap <C-S-w>   <Esc>:tabclose<CR>

" Quickly append semicolon or comma
" imap ;; <Esc>A;<Esc>
" imap ,, <Esc>A,<Esc>

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

nnoremap 0 ^
nnoremap ^ 0
nnoremap \ , " , is used for a mapleader, so we use \ to act as ,

" imap <C-,> <Esc>0a
" imap <C-;> <Esc>$a

