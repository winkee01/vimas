
## ctags & global

Please install ctags and GNU Global to better utilize the plugins.


Install Universal ctags and GNU global

(1) ctags

```shell
git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh && make
make install
```

(2) global

```shell
wget http://tamacom.com/global/global-6.6.4.tar.gz
tar xf global-6.6.4.tar.gz
sh reconf.sh
./configure --with-universal-ctags=/usr/bin/ctags && make
automake --add-missing
make install
```

after installation

```shell
export GTAGSCONF=/usr/share/gtags/gtags.conf
export GTAGSLABEL=new-ctags
gtags                         # gtags invokes Universal Ctags internally
gtags --gtagslabel=new-ctags  # succeed
```

#### Notes

Before you can build `global`, you would have to make sure below libraires or tools have already installed in your system:

- libtool
- texinfo
- ncurses
- help2man


###### errors

```
$ global --version
global: error while loading shared libraries: libltdl.so.7: cannot open shared object file: No such file or directory
```

The reason is that the path of `libltdl.so.7` is not in the library search path when executing global.

There two ways to solve it:

(1) set **`LD_LIBRARY_PATH`** environment variable

say your `libltdl.so.7` is located in `/usr/lib`, you can do this:

```shell
export LD_LIBRARY_PATH=/usr/local/lib
```

(2) anchor the search path in `/etc/ld.so.conf`

create a `xxx.conf` (any name you like) in `/etc/ld.so.conf.d/`, write the directory where `libltdl.so.7` located into the file, and execute `/sbin/ldconfig` to anchor it.

```
cat <<EOF > /etc/ld.so.conf.d/libltdl.conf
/usr/lib
EOF
/sbin/ldconfig
```









