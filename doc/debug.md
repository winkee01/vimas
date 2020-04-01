

## Errors debuging

Type below command to show startup messages:

```
:messages
:echo v:errmsg
:h mes
:h v:errmsg
```

##### 1. ctags

```
ctags job failed, returned: 1
```

Try enable below options:

```
let g:gutentags_trace = 1
let g:gen_tags#verbose = 1
```

##### 2. coc.nvim

```
[coc.nvim] javascript file not found, please compile the code or use release branch.
```

Try install `yarn`, or follow the instructions after execute `:checkhealth`.

