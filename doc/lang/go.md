### Go Programming

Before the LSP gets hot attention, the most prevail tools facilitate the go programming is **gocode**, which is packed into **vim-go**.

Nowadays, the Golang team releases **`gopls`**, to serve as the official LSP.

#### Install gopls

```shell
go get golang.org/x/tools/gopls@latest
```

Note:
(1) Don't use `-u` option as it will update dependencies which is not desired.
(2) If you encounter errors like `go: cannot use path@version syntax in GOPATH mode`
then execute it as:

```shell
GO111MODULE=on go get golang.org/x/tools/gopls@latest
```

As long as we have installed it, we can use it in vim pretty easily:

```viml
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
```

**Load gopls as server**
Sometimes we want to debug, we can load gopls as a server with `-rpc.trace` option

```shell
gopls -v serve -listen :10888 -rpc.trace
```

we can use `supervisor` to host gopls.


### gofmt
plugin `vim-autoformat` integrats a lot of autoformatters for differenct languages. It will use `gofmt` & `goimports` to by default for golang files.

### gotags

### snippets
- Shougo/neosnippet.vim

The gist of it is that you write a keyword and then press C-k, to “expand” the snippet. There might be multiple places for inserting your code. You can move to the next by hitting C-k again.

To enable neosnippet for vim-go, add this line:

```
let g:go_snippet_engine = "neosnippet"
```

You need to install neosnippet separately from vim-go. And you should also make sure to install neosnippet-snippets, which provides you with a set of default snippets for a long list of languages.

### debug

- [delve](https://github.com/derekparker/delve/)
- [vim-delve](https://github.com/sebdah/vim-delve)


