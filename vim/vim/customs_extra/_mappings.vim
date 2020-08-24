
" Default mapleader is \
let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>WQ :wa<CR>:q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>r :e .<CR>
nnoremap <cr> i<CR><ESC>

nnoremap 0 ^
nnoremap ^ 0
nnoremap \ , " , is used for a mapleader, so we use \ to act as ,

" inoremap <C-e> <C-o>$
" inoremap <C-i> <C-o>^
" Note above:
" C-i is equal to Tab key internally in vim, while Ultisnip uses Tab to trigger snippets completion,
" so this mapping here won't work

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" (1) Switching windows (Cycle through)
nnoremap <silent> <c-h> :let current_win = winnr()<CR><c-w>h:if current_win == winnr() \| wincmd b \| endif<CR>
nnoremap <silent> <c-j> :let current_win = winnr()<CR><c-w>j:if current_win == winnr() \| wincmd l \| endif<CR>
nnoremap <silent> <c-k> :let current_win = winnr()<CR><c-w>k:if current_win == winnr() \| wincmd r \| endif<CR>
nnoremap <silent> <c-l> :let current_win = winnr()<CR><c-w>l:if current_win == winnr() \| wincmd t \| endif<CR>

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

inoremap <c-l> <ESC>o
nnoremap <c-0> <c-w>>

nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>
