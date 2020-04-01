let g:lsc_server_commands = {
 \  'ruby': {
 \    'command': 'solargraph stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'go': {
 \    'command': 'go',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}

" let g:lsc_auto_map = {
"  \  'GoToDefinition': 'gd',
"  \  'FindReferences': 'gr',
"  \  'Rename': 'gR',
"  \  'ShowHover': 'K',
"  \  'Completion': 'omnifunc',
"  \}

let g:lsc_enable_autocomplete  = v:true

let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

" strongly recommend the following completeopt setting when using auto-completion:
set completeopt=menu,menuone,noinsert,noselect

" If you do not care for auto-completion but do wish to use LSP-based omni-completion,
" via <Control-x><Control-o>, then add the following to your ~/.vimrc:
let g:lsc_enable_autocomplete = v:false
