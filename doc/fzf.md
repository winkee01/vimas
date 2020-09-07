
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

### kill process using fzf

we can write a fish script "kp.fish" as below:
```
function kp --description "Kill processes"
  set -l __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  set -l __kp__kc $argv[1]

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end
```

now by executing command kp, we can select a process to kill

reference:
https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

### Search word under cursor
put below code to replace fzf.vim/autoload/fzf/vim.vim"

```
function! fzf#vim#grep(grep_command, has_column, ...)
  let fst = substitute(a:grep_command, '\(\a\+\).*', '\1', '')
  let lst = substitute(a:grep_command, '.*'.."'"..'\(.*\)'.."'", '\1', '')
  let former = substitute(a:grep_command, '\(.*\)\s.*$', '\1', '')
  if empty(lst)
    let lst = expand("<cword>")
  endif
  let name = fst
  let capname = toupper(fst[0])..fst[1:]
  let opts = {
  \ 'column':  a:has_column,
  \ 'options': ['--ansi', '--prompt', capname.'> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--delimiter', ':', '--preview-window', '+{2}-5',
  \             '--color', 'hl:4,hl+:12']
  \}
  function! opts.sink(lines)
    return s:ag_handler(a:lines, self.column)
  endfunction
  let opts['sink*'] = remove(opts, 'sink')
  try
    let prev_default_command = $FZF_DEFAULT_COMMAND
    let $FZF_DEFAULT_COMMAND = former.." '"..lst.."'"
    echo $FZF_DEFAULT_COMMAND
    return s:fzf(name, opts, a:000)
  finally
    let $FZF_DEFAULT_COMMAND = prev_default_command
  endtry
endfunction
```

