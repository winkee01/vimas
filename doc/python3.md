
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


Reference:
http://www.linuxfromscratch.org/blfs/view/svn/general/python3.html

