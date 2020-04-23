
## FZF Introduction

If you want to search from the project, you can add a new command ProjectFile like below:

```
function! s:find_git_root()
  let result = system('git rev-parse --show-toplevel')
  if v:shell_error == 0
    return substitute(result, '\n*$', '', 'g')
  endif
  return "."
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
```

#### mappings

you can have Ctrl-P like this:

```
nnoremap <C-p> :Files<Cr>
```

## ripgrep
ripgrep is a fast grep utility that fzf can plug on. the binary name is **rg**.

#### Installation

```
$ brew install ripgrep
$ sudo yum install ripgrep
$ sudo apt-get install ripgrep
```

Check [BurntSushi/ripgrep][ripgrep] for more details

[ripgrep]:https://github.com/BurntSushi/ripgrep#installation

#### Work with fzf

```
set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
# equivalent bash / zsh:
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
```

**mappings**

```
nnoremap <C-g> :Rg<Cr>
```

