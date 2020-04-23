
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

" (2) Switching tabs
" Alt < to previous tab
" Alt > to next tab
" Alt n to create new tab
" Alt w to close current tab
" Alt 0 to first tab
" Alt 9 to last tab
" Alt o to tabonly
nnoremap <silent> ≤   :tabprevious<CR>
nnoremap <silent> ≥   :tabnext<CR>
nnoremap <silent> ˜   :tabnew<CR>
nnoremap <silent> ∑   :tabclose<CR>
nnoremap <silent> º   :tabfirst<CR>
nnoremap <silent> ª   :tablast<CR>
" nnoremap <silent> ø   :tabonly<CR>
" === CAUTION: ===
" be careful with tabclose and tabonly, as once closed, can't be restored


" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>
" inoremap <C-S-w>   <Esc>:tabclose<CR>

" MaxOSX: move cursor to begin/end of line in insert mode, meta-key disabled
" Alt ; to end
" Alt , to begin
inoremap … <ESC>A
inoremap ≤ <ESC>I

" MacOSX: Move current line down/up
" Alt j move down
" Alt k move up
" nnoremap ∆ :m .+1<CR>gv==gv
" nnoremap ˚ :m .-2<CR>gv==gv
inoremap ∆ <Esc>:m .+1<CR>gv==gvi
inoremap ˚ <Esc>:m .-2<CR>gv==gvi
" vnoremap ∆ :m '>+1<CR>gv=gv
" vnoremap ˚ :m '<-2<CR>gv=gv

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

