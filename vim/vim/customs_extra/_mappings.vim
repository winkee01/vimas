
" Default mapleader is \
let mapleader=","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>WQ :wa<CR>:q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
"nnoremap <Leader>r :e .<CR>
nnoremap <CR> i<CR><ESC><Right>
" nnoremap <TAB> >>
" nnoremap <S-TAB> <<

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

" inoremap <c-l> <ESC>o
nnoremap <c-0> <c-w>>

nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>

" vil/yil to select/yank the whole line without line break
xnoremap il ^og_
onoremap <silent> il :normal vil<CR>

" c= or c: to change word around = or :
" you can also use 2wC
onoremap = :normal! f=wve<CR>
onoremap + :normal! f=wvE<CR>
onoremap ;; :normal! f:wve<CR>
onoremap : :normal! f:wvE<CR>

" Search & Replace

" 1) Search words under the cursor
" press s/ to search current word
" press <leader>/ to search a whole word in ex mode (need to type the word)
nnoremap <silent> <expr> s/ ':/\<'.expand('<cword>').'\><CR>'
nnoremap <leader>/ /\<\><left><left>
":execute "normal! /\\<".expand('<cword>')."\\>\<cr>"
":execute "/\\<".expand('<cword>')."\\>"

fun! s:wrap()
    let l = getcmdline()
    let pos = getcmdpos()

    " Remove
    if l[:1] is '\<' && l[-2:] is '\>'
        call setcmdpos(pos - 2)
        return l[2:len(l)-3]
    endif

    " Add
    if l[:1] isnot '\<'
        let l = '\<' . l
        let pos += 2
    endif
    if l[-2:] isnot '\>'
        let l .= '\>'
    endif
    call setcmdpos(pos)
    return l
endfun

cnoremap <expr> <F1> index(['/', '?'], getcmdtype()) is -1 ? "\<F1>" : "\<C-\>e<SID>wrap()\<CR>"
" Ref: https://vi.stackexchange.com/questions/18092/faster-way-to-search-for-whole-words

" 2) Replace the word under the cursor
" === Not a frequently used mapping ===
" nnoremap <Leader>i :%s/<C-r><C-w>//g<Left><Left>
" nnoremap <Leader>ic :%s/<C-r><C-w>//gc<Left><Left><Left>
" xnoremap <Leader>i :s/<C-r><C-w>//g<Left><Left>
" xnoremap <Leader>ic :s/<C-r><C-w>//gc<Left><Left><Left>

" 3) Replace the whole word under the cursor
" s  - replace
" sc - replace with confirmation
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>sc :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
xnoremap <Leader>s :s/\<<C-r><C-w>\>//g<Left><Left>
xnoremap <Leader>sc :s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Alternative writing
" nnoremap <expr> <Leader>s :%s/expand("<cword>")//g<Left><Left>
" nnoremap <expr> <Leader>sc :%s/expand("<cword>")//gc<Left><Left><Left>
" xnoremap <expr> <Leader>s :s/expand("<cword>")//g<Left><Left>
" xnoremap <expr> <Leader>sc :s/expand("<cword>')//gc<Left><Left><Left>

" add <> to the word under cursor
nnoremap <expr> <F8> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
xnoremap <expr> <F8> ':s#\<'.expand('<cword>').'\>#<&>#g<CR>'


"Replace whoe word one by one, press . to repeat
" cation: below mapping may cause delay when press single s
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" 5) Replase Last Search
nnoremap <Leader>r :%s/\<<C-r>/\>//g<Left><Left>
nnoremap <Leader>rc :%s/\<<C-r>/\>//gc<Left><Left><Left>
xnoremap <Leader>r :s/\<<C-r>/\>//g<Left><Left>
xnoremap <Leader>rc :s/\<<C-r>/\>//gc<Left><Left><Left>

nnoremap <silent> s) cgn
xnoremap <silent> s) "sycgn

" 6) Search and count matched
nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``'

" 7) Search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" 8) Replace visual selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>


" Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap - -<c-g>u
inoremap : :<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
"inoremap <Space> <Space><c-g>u

" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Clipboard mappings
" Ctrl+C copy 
" Ctrl+V paste 
" Ctrl+S save 
" Ctrl+Q exit 
" Ctrl+A select all 
" Ctrl+F search 
" Ctrl+Z undo 
" Ctrl+Y redo
vmap <C-c> "+y
" vmap <C-x> "+c conflict with ctrl-v in normal mode
"nmap <C-v> "+gP conflict with ctrl-v in visual mode
vmap <C-v> "+p
imap <C-v> <C-r><C-o>"
imap <C-s> <ESC>:w<CR>
" nmap <C-q> :wq<CR>
" imap <C-q> <ESC>:wq<CR>
nmap <C-a> ggVG<CR>
imap <C-a> <ESC>ggVG<CR>i
imap <C-f> <ESC>/
nmap <C-f> /
" imap <C-z> <ESC>u<CR>i
" nmap <C-z> u<CR>
" imap <C-y> <ESC>^R<CR>i
" nmap <C-y> ^R<CR>

" Reference
" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
" https://www.youtube.com/watch?v=fP_ckZ30gbs