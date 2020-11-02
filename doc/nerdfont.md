## Introduction
We want to display appealing file/folder icons in Vim, so we need to install `ryanoasis/vim-devicons` plugin, this plugins requires that **Nerd Font**(`ryanoasis/nerd-fonts`) is already installed in our system.

#### Step 1: Install Nerd Font
for MacOS, simply run:

```
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

Reference:
[option-4-homebrew-fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts)

#### Step 2: vim-devicons
install plugin `ryanoasis/vim-devicons` and setup vim configurations

```
Plug 'ryanoasis/vim-devicons'
```

in ~/.vimrc

```
set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h11
```

>Note: if you don't set guifont then you'll have to set your terminal's font, else things break!

Reference:
[vim-devicons installation](https://github.com/ryanoasis/vim-devicons/wiki/Installation)

[nerd-fonts](http://web.bluecomtech.com/saltfactory/github.com/ryanoasis/nerd-fonts.html)

