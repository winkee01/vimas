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
" Alt ; to end
" Alt , to begin
inoremap … <ESC>A
inoremap ≤ <ESC>I

" Mac OSX (Option as Meta key)
" execute "set <M-;>=\e;"
" execute "set <M-,>=\e,"
" inoremap <M-;> <ESC>A
" inoremap <M-,> <ESC>I

" Mac OSX (Option key as Normal)
" Alt j move down
" Alt k move up
" Note: due to vim's bugs, this may behave abnormally
nnoremap ∆ :m .+1<CR>gv==gv
nnoremap ˚ :m .-2<CR>gv==gv
inoremap ∆ <Esc>:m .+1<CR>gv==gvi
inoremap ˚ <Esc>:m .-2<CR>gv==gvi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Mac OSX (Option key as Meta)
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" nnoremap <M-j> :m .+1<CR>==
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv
" vnoremap <M-k> :m '<-2<CR>gv=gv

" Change list
nnoremap – g;
nnoremap ≠ g,
