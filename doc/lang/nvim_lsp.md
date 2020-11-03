### Install
Plug 'neovim/nvim-lsp'

### Usage
Using nvim-lsp provided commands to install language server.
```
:LspInstall
:LspInstallInfo
```

We can also install language server manually and set it up in nvim-lsp.

### Setup language server

from vim

```
call nvim_lsp#setup("texlab", {})
```

from Lua:

```
require 'nvim_lsp'.texlab.setup {
  name = "texlab_fancy";
  log_level = vim.lsp.protocol.MessageType.Log;
  settings = {
    latex = {
      build = {
        onSave = true;
      }
    }
  }
}

local nvim_lsp = require 'nvim_lsp'

-- Customize how to find the root_dir
nvim_lsp.gopls.setup {
  root_dir = nvim_lsp.util.root_pattern(".git");
}

-- Build the current buffer.
require 'nvim_lsp'.texlab.buf_build(0)
```

Note:
we can place Lua code in `xxx.lua` file, or we can wrap it up in a code block in `xxx.vim` file like this:

```
lua << EOF
    require'nvim_lsp'.clangd.setup{}
EOF
```

Reference:
https://www.joyk.com/dig/detail/1574020804758640


