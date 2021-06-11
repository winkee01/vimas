let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_trimmed_virtual_text = '50'
let g:diagnostic_auto_popup_while_jump = 1

" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

