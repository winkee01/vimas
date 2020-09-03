we can configure lightline to display fullpath by enable 'absolutepath' component, if we want to display filename, we can enable 'filename' component. we can do customizaiton to each component.

```viml
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤ "
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction
```

there are internal ways to display path info

```
:echo @%                |" directory/name of file
:echo expand('%:t')     |" name of file ('tail')
:echo expand('%:p')     |" full path
:echo expand('%:p:h')   |" directory containing file ('head')
set statusline+=%F
```

another way

```
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
```

Note that this configuration requires `vim-fugitive` plugin.

If you have vim-gitbranch plugin installed, replace the let root line with as follows.

```
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
```

reference:
https://github.com/itchyny/lightline.vim/issues/293