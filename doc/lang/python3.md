
### Install Python 3 in CentOS 7

#### Prerequisites

```shell
yum install -y openssl-devel
yum install -y libffi-devel
```

#### Install Python 3

```shell
CXX="/usr/bin/g++"              \
./configure --prefix=/usr/local \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
make
```

Now, run below commands as root user:

```shell
make install &&

chmod -v 755 /usr/local/lib/libpython3.8.so &&
chmod -v 755 /usr/local/lib/libpython3.so
```

Now, enable library search

```shell
cd /etc/ld.so.conf.d
```

Now, create a file `python3-x86_64.conf` (you can create whatever filename you like), write your library path, which is `/usr/local/lib`, into it.

then execute:

```shell
sudo /sbin/ldconfig
```

### Vim + Python

#### 1. Syntax Highlight

#### 2. Auto Format & Syntax Linter

**Python formating tools**
- `PEP 8` [Install autopep8](https://pypi.python.org/pypi/autopep8/) `python3 -m pip install pep8`
- `Yapf` [Install yapf] (https://pypi.python.org/pypi/yapf/) `python3 -m pip install yapf`
- `black` [Install black] (https://pypi.python.org/pypi/black/) `python3 -m pip install black`

##### `google/vim-codefmt`
`vim-codefmt` contain several built-in formatters (c/c++, css, go, js, python, etc.), and also allow new formatters to be plugged in.

three plugins must be installed together:

```
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
```

Add these autocmds into vimrc file:

```
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
```

also:
```
Vimjas/vim-python-pep8-indent
```

**Note:** `vim-autoformat` has delay when autoformatting python code, so the best way is to use 

#### 3. Snippets
`SirVer/UltiSnips` provides an snippet engine (also ships some default snippets for mainstream languages), and `honza/vim-snippets` provides a collection of snippets for many languages.

#### 4. Auto Completion (LSP)
We can install `pyls` to take the best advantage out of `nvim-lspconfig`.

```
python3 -m pip install python-language-server
```


#### 5. Go to definitions(LSP)
In addition to `pyls`, we can also install language integration plugs like `davidhalter/jedi-vim` to facilitate the jump around of definition or symbols and code completion.

#### 6. Code Refactoring
Code Refactoring often relates to variable/function/class renaming and modifications, so it's important we have a plugin that can recognize all kinds of symbols within Python language scope. `davidhalter/jedi-vim` is a very popular plugin for this job.

**How to use jedi-vim**
Move the cursor to the class or method you want to check, then press the various supported shortcut provided by jedi-vim:

- <leader>d: go to definition
K: check documentation of class or method
- <leader>n: show the usage of a name in current file
- <leader>r: rename a name



**vim-bootstrap**

```
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
let python_highlight_all = 1
```

Reference:
http://www.linuxfromscratch.org/blfs/view/svn/general/python3.html

