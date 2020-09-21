## Introduction
Vim2020 project provides the most advanced vim configurations for setting up a matured development environment.

The feature included are:
- The lastest and the most comprehensive plugin collections, save your search time
- Well designed architecture so that all components are configurable, best suit for advanced Vim users
- Automatically installation and setting up
- Multiple language supported including: C/C++/Go/Rust/Python/Javascript, etc
- Sufficient well-written documents, removing the confusion
- Cross-platform supported, tested on Mac OSX, Linux (Ubuntu/CentOS)
- Both Vim and NeoVim are supported
- Suitable for both fresh and advanced Vim users

### Requirements
Update your vim to the latest version(vim 8.0+).

One command setting up of vim-based developmental environment.

```shell
bash <(curl -fsSL https://raw.githubusercontent.com/winkee01/vim2020/master/install.sh)
```

## Installation

On installation, **vim2020** will backup the local `vimrc` and `~/.vim`—if found—to `vimrc.bak` and `~/.vim.bak`.

#### (1) one key installation
To get started please run:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/winkee01/vim2020/master/install.sh`"
```
**Note:** All subcomponents will be installed automatically. If you want to be asked
about each one, use:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/winkee01/vim2020/master/install.sh`" -s ask
```

#### (2) download repo
You can clone the project into any directory and execute the script `install.sh`, all things will be done, full steps are as below:

```bash
git clone https://github.com/winkee01/vim2020
cd vim2020
chmod +x install.sh
./install.sh
```

Note:
If we execute `./install.sh ask`, it will ask for confirmation(y/n) before every installation.

#### (3) nvim
Executing the sript with `nvim` option will install necessary config files for nvim:

```shell
./install.sh nvim
```

**Note:**
This command will install nvim configs only, not including all other file(tmux, git, vim, etc).

**Explain:**
**nvim** can utilize the configs of vim as long as `~/.config/nvim/init.vim` exists and has contents as below:

```shell
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

#### (4) mappings

All mappings resides in `vim/customs_extra` directory, `_mac.vim` is used only for Mac OSX system with respect to its `Meta` key, if you are using other platforms, you may need a corresponding config file like `_linux.vim` to make sure the mappings will work as expected. It's easy, you can just copy `_mac.vim` and change the meta key settings to something like `<M-x>` in your linux systems.

## Introduction
This project provides basic configuration files for the programming environmental setup. The included settings are for git, tmux, ctags and vim.

Before you can make the maximum use of the vim settings, you'd better have some basic knowledge of vim usage. Also, you need to install an independent tool —`gtags(ctags)`— to better cooperate with the provided vim settings.

For simplicity, I have included the minimun number of vim plugins to keep the least complecity and fewest mapping conflicts.


**gtags** is a tool that achieves the same funcitonanlity as the obsolete ctags.

```shell
wget http://tamacom.com/global/global-6.5.2.tar.gz
tar zxvf global-6.5.2.tar.gz
cd global-6.5.2
sh reconf.sh
./configure --prefix=<PREFIX> --with-exuberant-ctags=/usr/bin/ctags
make
sudo make install
```

for MaxOS, execute `brew install global` should be enough.

Since gtags/ctags works in most cases quite well for c/c++, in some cases you may need to make sure you have c++ installed, for example: `yum -y install gcc gcc-g++`.

Besides, if you are working on project of other languages, e.g. golang, you may want to install a language server, with which a lsp client (e.g. vim-go, coc.nvim, etc). can cooperate.

```shell
GO111MODULE=on go get golang.org/x/tools/gopls@latest
```

The architecture of the vim configuration is carefully designed, the plugins are managed separately to keep the `vimrc` clean and neat.


The management of plugin settings are seperated into six parts:

- colorscheme
- improvement
- language
- project
- textobject
- versioncontrol

Below is a simple introduction of vimrc

##### 1) Basic Part
This part provides basic settings of vim, like encoding, indentation, hidden buffer, scrolloff, etc, besides, it provides some useful mappings to facilitate the common operations.


##### 2) Plugin Part
Plugins are integrated into vimrc by a source command

```shell
source ~/.vim/load.vim
```

Plugins are managed by a popular vim plugin manager `junegunn/vim-plug`, it is installed automatically when vim2020 is installed.

Or, you can choose other plugin manager if you wish, the only thing you need to modify is `load.vim`

below is how things look like in `load.vim`

```shell
call plug#begin('~/.vim/plugged')
set rtp+=~/.vim2020/vim/sections/
runtime colorscheme.sect
runtime project.sect
runtime improvement.sect
runtime language.sect
runtime textobject.sect
call plug#end()
```

as shown, all plugins are installed into `~/.vim/plugged` by default.

In addition to the installation of the plugins, customized configuration files are placed in `vim/customs` directory, we can modify them as needed.


### Supported Language

Please enable language specific plugins in `sections/language.sect`

##### javascript

(1) external dependencies

- yarn `brew install yarn`
- eslint `yarn global add eslint`
- prettier `yarn global add prettier`
- ctags `brew install ctags`
- gtags `brew install global`

Please check `doc/*` for detailed introduction in how to install these dependencies.

(2) plugins

- vim-snippets
- vim-javascript

## Usage
The usage documentation of each plugin has been updated in doc.

include:

- Movement(vertically/horizontally, cross-file, etc)
- Appearance: status, color, highlight, etc.
- Shortcuts: mappings, utility functions, etc.
- Project: fuzzy find, grep, file manager, etc.
- Coding:
    + snippets, auto completion, linters, etc.
    + auto-formatting, commenting, etc.
    + tags: <del>Ctags/Gtags</del>
- Text objects



### Errors
If errors happen when you load vim or nvim, please temporarily disable some plugins as the default setup may not fit your environment, after you get a better feel of what you really need, you can take back those plugins quite easy.

Open `~/.vim/sections/language.plug`, below is a list of plugins you may want to temporarily disable in CentOS 7 because the default verion of vim is 7.4, which is too low.

- ludovicchabant/vim-gutentags
- fatih/vim-go
- natebosch/vim-lsc
- neoclide/coc.nvim

