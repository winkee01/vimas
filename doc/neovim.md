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

### Post-Install
Run `:checkhealth` in nvim to see are there anything missed.

## Introduction
Vim 8 and Neovim follow different conventions on where to keep their config- uration files. Vim 8 typically places them in a `~/.vim` directory, whereas Neovim uses the `~/.config/nvim` directory. 

Alternatively, you could set the $VIMCONFIG and $VIMDATA variables for your shell. For example, in bash you would run:

```
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim
```

The act of typing “vim” is probably burned into your fingers’ muscle memory. You might want to configure your shell with an alias so that typing “vim” starts Neovim instead of Vim. You could also set the $VISUAL variable to nvim, so that programs that launch a text editor (such as git commit) will use Neovim. In bash, you could set that up as follows:

```
   export VISUAL=nvim
   alias vim=nvim
   alias vi=nvim
```


#### Reusing Your Vim Configuration
For a smooth transition from Vim to Neovim, it helps to reuse your existing configuration. Neovim can load your Vim runtime configuration files, but first you have to tell it where to find them.

When Vim starts up, it looks in your `~/.vim` directory for a vimrc configuration file. The equivalent configuration file for Neovim is located in a `~/.config/nvim` directory and is called init.vim (:help base-directories).

You’ll have to create the configuration directory for Neovim:

```
mkdir -p ~/.config/nvim/
```

Next, create and save a `~/.config/nvim/init.vim` file with the following contents:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## clipboard
neovim is not able to speak to the system clipboard directly. Instead it calls an external program as a provider. In linux, it will look for `xsel` or `xclip`, whichever is available and use that to talk to the clipboard.

This information is all found in :h clipboard which is where neovim instructed you to look when you encountered the error.

error

```
## Clipboard (optional)
  - WARNING: No clipboard tool found. Clipboard registers (`"+` and `"*`) will not work.
    - ADVICE:
      - :help clipboard
```


**Ubuntu**

```shell
sudo apt-get install -y xsel xclip
```

**Usage:**

```
xclip -selection clipboard testfile.txt
xsel testfile.txt 
xsel --clipboard < testfile.txt 
```

## Python Support
In Neovim, Python is not supported out of the box. If you want to use plugins and tools that are implemented in Python (e.g. `neovim-remote`), then you’ll have to install the Python client.

To enable the Python 3 provider, you need to install the Python client. You can get this using pip:

```
pip3 install --upgrade neovim
```

Now restart Neovim and try running this command:

```
:py3 print('hello') ❮ hello
```

You’ll see the hello message printed.

**errors**

```yaml
## Python 2 provider (optional)
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 2:
          python2 not found in search path or not executable.
          python2.7 not found in search path or not executable.
          python2.6 not found in search path or not executable.
          python not found in search path or not executable.
  - INFO: Executable: Not found

## Python 3 provider (optional)
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 3:
          /usr/bin/python3 does not have the "neovim" module. :help provider-python
          python3.10 not found in search path or not executable.
          /usr/bin/python3.9 does not have the "neovim" module. :help provider-python
          python3.8 not found in search path or not executable.
          python3.7 not found in search path or not executable.
          python3.6 not found in search path or not executable.
          python not found in search path or not executable.
  - INFO: Executable: Not found
```

##### Reference:
https://github.com/neovim/neovim/wiki/Installing-Neovim