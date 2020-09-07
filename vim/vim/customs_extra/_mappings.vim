
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
"nnoremap <S-Tab> <C-w>w

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

inoremap <c-l> <ESC>o
nnoremap <c-0> <c-w>>

nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>


" Search & Replace
" nnoremap <Leader>s :%s///g<Left><Left>
" nnoremap <Leader>sc :%s///gc<Left><Left><Left>
" xnoremap <Leader>s :%s///g<Left><Left>
" xnoremap <Leader>sc :%s///gc<Left><Left><Left>

"nnoremap <Leader>s :%s/expand("<cword>")//g<Left><Left>

" 1) Search words under the cursor
"execute "normal! /\\<".expand('<cword>')."\\>\<cr>"
"execute "/\\<".expand('<cword>')."\\>"

" 2) Replace words under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'

xnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
xnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'

" 3) Search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" 4) Replace visual selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" 5) Replace a few instance one by one
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Reference
" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
" https://vim.fandom.com/wiki/Search_for_visually_selected_text


