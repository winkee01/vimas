## Introduction
This document introduces a vim setup for Ocaml


#### Shortcuts
Some default shortcuts are already there to use.

- \s switches between the .ml and .mli file
- \c comments the current line / selection (\C to uncomment)
- % jumps to matching let/in, if/then, etc (see :h matchit-install)
- \t tells you the type of the thing under the cursor (if you compiled with -annot)


#### plugins
You may need some of below plugins for syntax checking and autocompletion.

- scrooloose/syntastic  `syntax check`
- def-lkb/merlin        `auto completion`
- jpalardy/vim-slime    `REPL integration`
- OCamlPro/ocp-indent   `ocp-indent`


#### usage

1. merlin

```
opam install merlin
opam user-setup install
```

Above commands will install merlin executable as well as the merlin plugin files.
The executable is `ocamlmerlin`, by default localted in `~/.opam/default/bin/ocamlmerlin`.
The plugin files are located in `~/.opam/default/share/` directory, we should set `rtp` in vim so that vim can use it.

```viml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"'''')
```

The installed merlin has a directory structure like this:

```
merlin
    └── vim
        ├── autoload
        ├── doc
        ├── ftdetect
        ├── ftplugin
        ├── plugin
        ├── syntax
        └── syntax_checkers
```

for more instructions, check [vim-from-scratch wiki](https://github.com/ocaml/merlin/wiki/vim-from-scratch).


2. OCaml-LSP

``````
opam pin add ocaml-lsp-server https://github.com/ocaml/ocaml-lsp.git
opam install ocaml-lsp-server
``````

The installed executable is `ocaml-lsp-server`.


#### github source

```
https://github.com/scrooloose/syntastic
https://github.com/def-lkb/merlin - auto completion
https://github.com/jpalardy/vim-slime
https://github.com/OCamlPro/ocp-indent
```

