
### Rust programming

##### 1. RLS, Rust Language Server

[rls source](https://github.com/rust-lang/rls)

**Install the RLS**

```shell
rustup component add rls rust-analysis rust-src
```

##### 2. ra, rust-analyzer
[ra source](https://github.com/rust-analyzer/rust-analyzer)

```shell
rustup component add rust-src
```

Note: the binary provided by rust-analyzer project is `ra_lsp_server`.

**Integration with coc**

`coc.nvim` provides some extentions to better facilitate the use of rls and ra, we can install these extentions by:

```shell
:CocInstall coc-rls
:CocInstall coc-rust-analyzer
```

If we don't want to use these extentions, we can simple config `coc-settings.json` to use the native binary.

e.g.

```json
  "languageserver": {
    "rust": {
      "command": "ra_lsp_server",
      "filetypes": ["rust"],
      "rootPatterns": ["Cargo.toml"]
    }
  }
```
