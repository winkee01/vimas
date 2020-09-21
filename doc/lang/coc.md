
### Installing coc.nvim

**coc.nvim** plugin has requirements:

- neovim >= 0.3.1 or vim >= 8.0.1453
- node >= 8.10.0
- yarn


(1) neovim

```shell
git clone https://github.com/neovim/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```


(2) node

```shell
curl -sL install-node.now.sh | sh
```


(3) yarn

```shell
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```


### Coc configurations

Run `:CocConfig`, which will open main config file `~/.config/nvim/coc-settings.json` (empty for new installation).


copy below settings into `~/.vim/coc-settings.json`
or `~/.config/nvim/coc-settings.json`

```json
{
    "languageserver": {
        "golang": {
            "command": "gopls",
            "rootPatterns": ["go.mod"],
            "filetypes": ["go"]
        },
        "rust": {
            "command": "rls",
            "filetypes": ["rust"],
            "rootPatterns": ["Cargo.toml"]
        }
    }
}
```


### Check Health

run `:checkhealth` to check the status of libraries required by `coc.nvim`.



## Language Support

```
:CocInstall coc-python
:CocInstall coc-phpls
:CocInstall coc-eslint
:CocInstall coc-json coc-css
:CocInstall coc-rls
:CocInstall coc-tsserver
```


