lua <<EOF
local nvim_lsp = require'nvim_lsp'

-- clangd
nvim_lsp.clangd.setup{
    root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
}

-- lua
nvim_lsp.sumneko_lua.setup{}

-- gopls
nvim_lsp.gopls.setup{
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod', 'main.go');
}

-- rust
nvim_lsp.rls.setup{}

-- typescript
-- npm i -g typescript typescript-language-server
-- nvim_lsp.tsserver.setup{on_attach=require'diagnostic'.on_attach}
nvim_lsp.tsserver.setup{}
nvim_lsp.rome.setup{}

-- python3
-- python3 -m pip install python-language-server
nvim_lsp.pyls.setup{}

-- viml
nvim_lsp.vimls.setup{}
EOF

" mappings
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
