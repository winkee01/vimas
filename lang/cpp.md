## Syntax highlighting
Vim has limited built-in syntax highlighting support, we may need to install some enhanced syntax highlighting plugins.

- vim-polyglot (a language pack, support highlighting for many languages)
- octol/vim-cpp-enhanced-highlight (support c++11/14/17 syntax hightlighting)

## snippets
Snippets can save a lot of boilerplate code typing work thus improves coding efficiency.
When you get familiar with code snippets, it's recommanded to use your own customized snippets.

- honza/vim-snippets

## symbol indexing
  -
- ctags (Universal Ctags)
- GNU Global (aka gtags, add symbol reference)
- vim-gutentags (vim plugin that automatically manages tags generation using `ctags` or `gtags` asyncronously)


## Intellisense Engine and LSP Client
Language Server provides a comprehensively independent solution for language specific assistance like: syntax checking/linting, auto completion, documentation, etc.

Plugin options:

- Coc.nvim(a lsp framework support many languages)
- Ale (asynchronous, fast)
- NCM2 (asynchronous completion framework)
- YouCompleteMe (has limited language support, suitable only for c/c++)
- Deoplete(asynchronous completion, support many language like c/c++, python, javascript, etc)
- neoComplete (fits only auto completion)
- Syntastic (synchronous, slow)

## Language Server

Before you can take the best out of a backend language server, you have to install it

For cpp, we have below three:

- clangd
- ccls
- cquery

**clangd** is a language server for c/c++ included in LLVM project. It has features like code completion, syntax linting, go-to-definition, etc.
**ccls** is a successor of cquery, it forks cquery and develops on it.

## Language Server Installation

#### (1) clangd (MaxOS)

for MacOS:

    brew install llvm

for Ubuntu:

    sudo apt-get install clangd-9

for Binary package

- download release: [clangd release](https://github.com/clangd/clangd/releases)
- copy `bin/clangd` to `/usr/local/bin/`
- export `PATH=`


**clangd** uses two config file `compile_commands.json` and `compile_flags.txt`, You can use either of them.

example `compile_commands.json`

```json
{
    "directory": "/path/to/current_project",
    "command": "/usr/bin/clang++ -isystem /Library/Developer/CommandLineTools/usr/include/c++/v1 -I/path/to/current_project/include -std=c++17",
    "file": "/path/to/current_project/*.cpp"
}
```

example `compile_flags.txt`

```
-xc++
-std=c++17
-Wall
-nostdinc
-nostdinc++
-isystem/usr/include
-isystem/usr/local/include
-isystem/Library/Developer/CommandLineTools/usr/include
-isystem/Library/Developer/CommandLineTools/usr/include/c++/v1
-isystem/Library/Developer/CommandLineTools/usr/lib/clang/10.0.1/include
-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
```



#### (2) ccls

TODO
