
### Rust programming
A working Rust programming environment should includes at least these components:

- Syntax-highlighting
- Autocompletion
- Linting
- Autoformatting


### 1. Language Server

(1) RLS, Rust Language Server

[rls source](https://github.com/rust-lang/rls)

**Install the RLS**
As advised from its documentation, we can install RLS from the nightly toolchain.

```
rustup component add rls --toolchain nightly
```

If it not work, we can try find out `nightly-YYYY-MM-DD` toolchain.

```
rustup component add rls --toolchain nightly-YYYY-MM-DD
```

or we can simply do it like:

```shell
rustup component add rls rust-analysis rust-src
```

(2) ra, rust-analyzer
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

If we don't want to use these extentions, we can simple config `~/.config/nvim/coc-settings.json` to use the native binary as below:

```json
"languageserver": {
  "rust": {
    "command": "ra_lsp_server",
    "filetypes": ["rust"],
    "rootPatterns": ["Cargo.toml"]
  }
}
```

### 2. Linters

#### (1) Clippy 
**Clippy** is a Rust semantic linter, we can install it via

```
rustup component add clippy
```

#### (2) Racer 
**Racer** is a tool providing autocompletion for rust’s standard library.
We can simply install it via:

```
cargo +nightly install racer
```

Afterwards we have to set the RUST_SRC_PATH variable to

```
$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src.
```

### 3. rustfmt
**rustfmt** performs autoformatting on rust-code. we can installed rustfmt-nightly via:

```
cargo install rustfmt-nightly
```

### Plugins

```
Plug 'neovim/nvim-lsp'
Plug 'racer-rust/vim-racer'
```

### rust.vim

```
Plug 'rust-lang/rust.vim'
```

**`rust.vim`** is a Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more. It requires Vim 8 or higher for full functionality. Some things may not work on earlier versions.



