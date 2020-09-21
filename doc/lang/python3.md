
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


### python format
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


**Note:** `vim-autoformat` has delay when autoformatting python code, so the best way is to use 

Reference:
http://www.linuxfromscratch.org/blfs/view/svn/general/python3.html

