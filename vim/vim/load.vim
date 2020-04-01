call plug#begin('~/.vim/plugged')
set rtp+=~/.vim/sections/
runtime colorscheme.sect
runtime project.sect
runtime improvement.sect
runtime language.sect
runtime textobject.sect
" runtime versionctrol.sect
call plug#end()

" ===================== Load Plugin Customizations =======================
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
