
### web
- vim color-esque
- vim-jinja
- vim-closetag

#### coc family

```
coc-snippets
coc-pairs
coc-tsserver
coc-html
coc-css
coc-prettier
coc-angular
coc-vimtex
```

Some people may not live withouth `vim-css-color`, but for people using neovim, I highly suggest `nvim-colorizer` instead. It is really fast

### Syntax highlighting

```
HerringtonDarkholme/yats.vim
leafgarland/typescript-vim
maxmellon/vim-jsx-pretty
peitalin/vim-jsx-typescript
jparise/vim-graphql
```

Note:
In Vim 8.2 no plugins are necessary, TS is supported out of the box(OOTB). It is implemented by including the yats.vim plugin into Vim distribution.
Unfortunately, typescriptreact support is not perfect. It works in only simple cases.

The issue is known but there’s no solution. I’ve tried `typescript-vim` and `vim-jsx-typescript` plugins but those not very good either. So I went ahead and fixed this specific case. But there are many other issues. Regex syntax highlighting can only get you so far. Semantic highlighting is on the way.


### LSP (for intellisense, autocompletion, etc)

```
coc.nvim
vim-lsp
```

for TypeScript, 
```
neoclide/coc-tsserver
theia-ide/typescript-language-server

:CocInstall coc-tsserver
let g:coc_global_extensions = [ 'coc-tsserver' ]
```

mattn/emmet-vim

### Testing



### File Explorer
- fern
- defx
- nerdtree


### common
- vim-surround 
- coc.nvim
- vim-prettier
- ultisnips
