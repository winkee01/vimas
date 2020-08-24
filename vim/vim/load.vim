call plug#begin('~/.vim/plugged')
set rtp+=~/.vim/sections/
runtime colorscheme.sect
runtime project.sect
runtime improvement.sect
runtime language.sect
runtime textobject.sect
"runtime versionctrol.sect
call plug#end()

" ===================== Load Plugin Customizations =======================
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if has("gui_running")
    if g:os == "Darwin"
        "exe 'source' s:custom_extra_dir . _mac.vim
    elseif g:os == "Linux"
        "exe 'source' s:custom_extra_dir . _linux.vim
    elseif g:os == "Windows"
        "exe 'source' s:custom_extra_dir . _win.vim
    endif
endif

" Customizations for general settings
let s:custom_extra_dir = '~/.vim/customs_extra'
for fpath in split(globpath(s:custom_extra_dir, '*.vim'))
  exe 'source' fpath
endfor

" Customization for plugins
let s:custom_dir = '~/.vim/customs'
for key in keys(g:plugs)
  let s:idx = stridx(key, ".")
  if s:idx > 0
     let pth = globpath(s:custom_dir, strpart(key, 0, s:idx).'\.vim')
     if pth != ''
        exe 'source' pth
     endif
  else
     let pth = globpath(s:custom_dir, key.'\.vim')
     if pth != ''
        exe 'source' pth
     endif
  endif
endfor
" ===================== Load Plugin Customizations =======================
