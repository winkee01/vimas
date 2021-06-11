" Default settings are located in:
" https://github.com/neovim/nvim-lspconfig/tree/master/lua/nvim_lsp/*.lua

lua << EOF
-- keymaps
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

vim.lsp.set_log_level("debug")
EOF

"lua <<EOF
"local nvim_lsp = require'nvim_lsp'
"local lsp_status = require('lsp-status')
"local diagnostic = require('diagnostic')
"local completion = require('completion')
"local nvim_lsp = require('nvim_lsp')
"local configs = require('nvim_lsp/configs')
"local util = require('nvim_lsp/util')
"
"local on_attach = function(client, bufnr)
"  lsp_status.on_attach(client, bufnr)
"  diagnostic.on_attach(client, bufnr)
"  completion.on_attach(client, bufnr)
"  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "<c-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
"  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
"end
"
"lsp_status.register_progress()
"lsp_status.config({
"  status_symbol = '',
"  indicator_errors = 'e',
"  indicator_warnings = 'w',
"  indicator_info = 'i',
"  indicator_hint = 'h',
"  indicator_ok = 'ok',
"})
"
"-- clangd
"nvim_lsp.clangd.setup{
"    on_attach = on_attach
"}
"
"-- lua
"nvim_lsp.sumneko_lua.setup{}
"
"-- gopls
"nvim_lsp.gopls.setup{
"    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod', 'main.go'),
"    on_attach = on_attach
"}
"
"-- rust
"nvim_lsp.rls.setup{}
"
"-- flow: javascript
"require'nvim_lsp'.flow.setup{}
"
"-- typescript
"-- npm i -g typescript typescript-language-server
"-- nvim_lsp.tsserver.setup{on_attach=require'diagnostic'.on_attach}
"nvim_lsp.tsserver.setup{}
"nvim_lsp.rome.setup{}
"
"-- python3
"-- python3 -m pip install python-language-server
"nvim_lsp.pyls.setup{
"    on_attach = on_attach,
"    capabilities = lsp_status.capabilities
"}
"-- viml
"-- npm install -g vim-language-server
"nvim_lsp.vimls.setup{}
"vim.lsp.set_log_level(0)
"EOF

" mappings
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

