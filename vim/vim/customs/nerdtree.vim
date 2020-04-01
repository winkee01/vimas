" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

let NERDTreeIgnore = ['\.pyc','\~$','\.swp']


autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use nerdtree to display when vim does not specify any dir or file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" When there is no file open, close nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

" press ctrl + \ to open Nerdtree
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
map <leader>r :NERDTreeFind<cr>

" Show hidden file
let NERDTreeShowHidden = 1

" add/delete file/directory
" Press m to bring up the NERDTree Filesystem Menu.
" This menu allows you to create, rename, and delete files and directories.
" Type a to add a child node and then simply enter the filename.
" To create a directory follow the same steps but append a / to the filename.

" Close all windows except current on and nerdtree
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()
    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()

nnoremap <silent> <leader>o :call OnlyAndNerdtree()<CR>


