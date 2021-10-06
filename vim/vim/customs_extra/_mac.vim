" This file works on Mac OSX only!

" (2) Tabs
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
" CAUTION: be careful with tabclose and tabonly, as once closed, can't be restored

" Tabs
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <M-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <M-Down> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" note: <M-Right> has no effect, possibly intercepted by the system

" Mac OSX (Option as Normal key)
" In INSERT mode
" Alt , move cursor to line begin
" Alt ; move cursor to line end
inoremap <silent> ≤ <ESC>I
inoremap <silent> … <ESC>A

" Mac OSX (Option as Meta key)
" execute "set <M-;>=\e;"
" execute "set <M-,>=\e,"
" inoremap <M-;> <ESC>A
" inoremap <M-,> <ESC>I

" Mac OSX (Option key as Normal)
" Move line up/down
" Alt j move down
" Alt k move up
" Note 1): due to vim's bugs, this may behave abnormally
" Note 2): tpope/vim-unimpaired also has [e and ]e to move line up/down
nnoremap <silent> ∆ :m .+1<CR>gv==gv
nnoremap <silent> ˚ :m .-2<CR>gv==gv
inoremap <silent> ∆ <Esc>:m .+1<CR>gv==gvi
inoremap <silent> ˚ <Esc>:m .-2<CR>gv==gvi
vnoremap <silent> ∆ :m '>+1<CR>gv=gv
vnoremap <silent> ˚ :m '<-2<CR>gv=gv

" Mac OSX (Option key as Meta)
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" nnoremap <silent> <M-j> :m .+1<CR>==
" nnoremap <silent> <M-k> :m .-2<CR>==
" inoremap <silent> <M-j> <Esc>:m .+1<CR>==gi
" inoremap <silent> <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <silent> <M-j> :m '>+1<CR>gv=gv
" vnoremap <silent> <M-k> :m '<-2<CR>gv=gv

" Mac OSX (Option key as Meta)
" Change list
" Jump between change list
" Alt - move cursor to previous change
" Alt + move cursor to next change
nnoremap – g;
nnoremap ≠ g,
