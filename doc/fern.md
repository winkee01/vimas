## Introduction
In order to display nice devicons in fern, we need to install these plugins

```
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
```

#### `nerdfont.vim` 
This is a simplified version of `vim-devicons`.

usage:

```
:echo nerdfont#find()
:echo nerdfont#find(expand('~/.vimrc'))
:echo nerdfont#find(expand('~/.vim'))
:echo nerdfont#find(expand('~/.vimrc'), 0)
:echo nerdfont#find(expand('~/.vimrc'), 1)
```

#### `fern-renderer-nerdfont.vim`
This plugin will add file type icons through `nerdfont.vim`.

usage:

```
let g:fern#renderer = "nerdfont"
```

#### `glyph-palette.vim`
This plugin will apply colors on Nerd Fonts, with this plugin installed, the following (and potentially more) Nerd Fonts integrations will be nicely highlighted.

- vim-devicons
- nerdfont.vim
- fern-renderer-nerdfont.vim

usage:

```
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
```

