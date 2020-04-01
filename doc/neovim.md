## Installing Neovim


#### CentOS 7 / RHEL 7

```shell
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
# you might need python2-neovim as well on older Fedora releases
```

### Python 2 & Python 3 Support
Some plugins need python 2 or python 3 to be installed so that they can function correctly.

The most common library we need it **pynvim**, use below instructions to install it.

```shell
sudo yum install python-pip
python -m pip install --user --upgrade pynvim
```

We can encounter the warning that version of pip and setuptools are too low, use below command to update them and then reinstall the **pynvim**.

```shell
sudo pip install --upgrade pip setuptools
python -m pip install --user --upgrade pynvim
```


reference:
https://github.com/neovim/neovim/wiki/Installing-Neovim