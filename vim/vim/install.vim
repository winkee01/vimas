call plug#begin('~/.vim/plugged')
set rtp+=~/.vim/sections/
runtime colorscheme.sect
runtime project.sect
runtime improvement.sect
runtime language.sect
runtime textobject.sect
" runtime versionctrol.sect
call plug#end()