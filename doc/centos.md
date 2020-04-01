
### Intall Core Development Tools

```shell
sudo yum group install "Development Tools"
```

or

```shell
yum groupinstall 'Development Tools'
```

##### Commands to list groups

```shell
yum group list
```

result

```
Available Environment Groups:
   Minimal Install
   Compute Node
   Infrastructure Server
   File and Print Server
   Cinnamon Desktop
   MATE Desktop
   Basic Web Server
   Virtualization Host
   Server with GUI
   GNOME Desktop
   KDE Plasma Workspaces
   Development and Creative Workstation
Available Groups:
   Cinnamon
   Compatibility Libraries
   Console Internet Tools
   Development Tools <-------------------- yum groupinstal this
   Educational Software
   Electronic Lab
   Fedora Packager
   General Purpose Desktop
   Graphical Administration Tools
   Haskell
   LXQt Desktop
   Legacy UNIX Compatibility
   MATE
   Milkymist
   Scientific Support
   Security Tools
   Smart Card Support
   System Administration Tools
   System Management
   TurboGears application framework
   Xfce
```


These development tools include:

- automake
- autoconf
- m4
- gcc
- binutils
- bison
- flex
- gcc (c compiler)
- gcc-c++ (c++ compiler)
- gettext
- libtool
- make
- patch
- pkgconfig
- redhat-rpm-config
- rpm-build
- rpm-sign


### Other libraries and tools

- zlib
- curl
- expet
- LibArchive
- openssl (for Python3)
- libffi (for Python3)
- libtool
- help2man
- texinfo(makeinfo)
- ncurses

```shell
yum install zlib-devel
yum install curl-devel
yum install expat-devel
yum install libarchive-devel
yum install openssl-devel
yum install libffi-devel
yum install ncurses-devel
```

**Notes:**

- LibArchive >= "3.3.3"

```shell
wget  https://github.com/libarchive/libarchive/releases/download/v3.4.2/libarchive-3.4.2.tar.xz
./configure --prefix=/usr --disable-static &&
make
sudo make install
```


### Yum search

```shell
yum search <package>
```




