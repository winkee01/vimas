### PreRequisites
- Nightly build: Neovim v0.5.0-dev
- Python module: python-pynvim

`nvim-lspconnfig` requires Neovim Nightly(v0.5 prelease) to work, we need to install **Neovim v0.5.0-dev** first.

Also, neovim needs **pynvim** module to work.

#### 1. macOS

```shell
brew install --HEAD neovim
```

#### 2. Ubuntu

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

**Check Neovim Version**

```shell
nvim --version
```

For **pyvim** module

```shell
pip install --upgrade pynvim
```

##### Note:
- Some plugins need ruby support, thus we need to install ruby,
- Some plugins nneed nodejs support, we need to install node and npm (or yarn)

### Install
Plug 'neovim/nvim-lspconfig'

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


