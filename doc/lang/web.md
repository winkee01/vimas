
# Web designing in VIM
An web designing environment often involves with: HTML, CSS, Javascript, TypeScript, ReactJS, Vue.js.


## Syntax highlighting

####HTML, CSS, Javascript
A syntax highlighting plugin usually integrats highlighting rules for many language, we have below popular options:

- **`HerringtonDarkholme/yats.vim`**
- **`leafgarland/typescript-vim`**
- **`maxmellon/vim-jsx-pretty`**
- **`peitalin/vim-jsx-typescript`**
- **`jparise/vim-graphql`**
- **`vim-css3-syntax`**
- **`scss-syntax.vim`**

Note:
In Vim 8.2 no plugins are necessary, TS is supported out of the box(OOTB). It is implemented by including the `yats.vim` plugin into Vim distribution.
Unfortunately, **`typescriptreact`** support is not perfect. It works in only simple cases.

The issue is known but there’s no solution. I’ve tried `typescript-vim` and `vim-jsx-typescript` plugins but those not very good either. So I went ahead and fixed this specific case. But there are many other issues. Regex syntax highlighting can only get you so far. Semantic highlighting is on the way.

## Snippets

#### HTML
**`mattn/emmet-vim`** provides a very productive way to simplify the writting of HTML tags.
**`vim-closetag`** is an extremely useful tool for writing HTML tags.

#### Javascript
**`honza/vim-snippets`** is a popular snippet plugin that includes snippets for many languages. For example, tt includes ES6 snippets for ReactJs in its `javascript-es6-react.snippets` file.

#### Typescript & React
**`mlaursen/vim-react-snippets`** is one of the plugins that also provides some convenient snippets for ReactJs.

## Formatting
#### (1) Formatting Tools
there are many independent **formatting tools** for web development, for example:

- **`prettier`** 
- **`js-beautify`**
- **`jscs`**
- **`standard`**
- **`xo`**
- **`eslint`**

Usually, installing one of the above tools we should be satisfied.

#### (2) Vim Plugins
We also need to install vim plugins so that vim can interact with the above tools. There are several options:

- `prettier/vim-prettier`
- `coc-prettier` (if we have installed `coc-nvim`, we can install it by `:CocInstall coc-prettier` in vim)
- `vim-autoformat` includes supports for many languages like js, golang, c/c++, etc. But on my machine, it's a bit slow, why?
- `pangloss/vim-javascript` is just another plugin that can interact with also has some latency, why?

## LSP
In old days, we need to install different plugins for different editors to serve out needs of intellisense, autocompletion, definition, reference, etc. The worst thing of it is that plugins has to implement all these functionalities repeatedly for each language and for each editor, the code is highly coupled with editor and completely un-reusable. But all has changed since LSP (Language Server Protocol) was proposed, it's only needed that each language implement its own LSP Server, this is completely independent of any editor, now plugin developers only need to implement a LSP Client to communicate with the LSP Server.
</hr>

**neovim/nvim-lspconfig**
</p>
**Neovim** has planed to provide internal LSP client out of the box. Upon the release of version 0.5.0, Neovim provides an official plugin **`neovim/nvim-lspconfig`** to serve temporarily as the LSP client before it's integrated into Neovim. Using this plugin, we can interact with the external LSP servers of different language very easily.

#### (1) Vim plugins

The 'old' vim plugins to help interact with LSP servers are:

- **`neoclide/coc.nvim`**
- **`prabirshrestha/vim-lsp`**

**coc.nvim** is an plugin integrates many functionalities like intellisense, autocompletion, etc. If we install this plugin, we also need to install some cooresponding components or sub-plugins for specific languages. For example, if we need support for `typescript`, we should do `:CocInstall coc-tsserver` so that it can interact with external `tsserver`. There are many other sub-plugins which may look like this:

```
coc-snippets
coc-pairs
coc-tsserver
coc-html
coc-css
coc-prettier
coc-angular
coc-vimtex
```

#### (2) Language Servers
Language Servers of different language are just third party implementation of LSP proposed by [Microsoft](https://microsoft.github.io/language-server-protocol).

A list of LSP for the popular languages are:

###### C/C++
- **`ccls`**
- **`clangd`**

###### Golang
- **`gopls`**

###### Python
- **`pyls`**
- **`pyls_ms`**
- **`jedi-language-server`**

###### Rust
- **`rls`**
- **`rust-analyzer`**

###### Javascript & TypeScript
- **`typescript-language-server`**
- **`rome`**

###### Viml
- **`vimls`**

###### Lua
- **`sumneko_lua`**

## ESlint
**`ESlint`** is a tool for identifying and reporting on patterns found in JavaScript code, it's similar to JSLint and JSHint except is uses Espree for javascript code parsing by default and completely plugable.

##### (1) Installation
```
npm install eslint --save-dev
or
yarn add eslint --dev
```

##### (2) Usage
Before we can use ESlint properly, we should setup a config file by executing:
```
npx eslint --init
or
yarn run eslint --init
```

##### babel-eslint
`babel-eslint` is moved to `@babel/eslint-parser`!
To make `@babel/eslint-parser`, we need to make sure @babel/core is in our project's node_modules.

```
npm install --save-dev @babel/core
or
yarn add @babel/core --dev
```

then, we can do the updates:

```
npm uninstall babel-eslint babel-eslint-plugin
npm install --save-dev @babel/eslint-parser @babel/eslint-plugin
```

int `.eslintrc.js`, we can add this:

```
module.exports = {
    parser: "@babel/eslint-parser"
    plugins: [
        "@babel
    ]
};
```
`@babel/eslint-parser` expects a standard Babel configuration file (`.babelrc` or `babel.config.js`).

Check [this](https://babeljs.io/blog/2020/07/13/the-state-of-babel-eslint) or [issue/788](https://github.com/babel/babel-eslint/issues/788) out for more details.

##### Question: 
Is it ok to install ESlint globally?

##### Answer: 
Yes it is, but **not recommended** as stated in the official site, because they think a shareable config across all javascript projects is a bad idea. **I don't hold that point though because it adds unnecessary complexity and loses the flexibility**.

##### Notes:
When executing `esling --init`, it will create a `.eslintrc.{js.yml,json}` file in current directory interactively, the question it will ask is like this:

```
✔ How would you like to use ESLint? · problems
✔ What type of modules does your project use? · esm
✔ Which framework does your project use? · react
✔ Does your project use TypeScript? · No / Yes
✔ Where does your code run? · browser, node
✔ What format do you want your config file to be in? · YAML
```

The command executed in the behind is:

```
npm install eslint-plugin-react@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest
```

upon success, message will be shown:
```
+ eslint-plugin-react@7.21.1
+ @typescript-eslint/eslint-plugin@4.2.0
+ @typescript-eslint/parser@4.2.0
```

`.eslintrc.json` will be look like:

```
{
    "env": {
        "browser": true,
        "es2021": true,
        "node": true
    },
    "extends": [
        "eslint:recommended",
        "plugin:react/recommended",
        "plugin:@typescript-eslint/recommended"
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 12,
        "sourceType": "module"
    },
    "plugins": [
        "react",
        "@typescript-eslint"
    ],
    "rules": {
    }
}
```

Notice:
If using Typescript with React, the `eslint-plugin-react` should be installed.

If we want a full-fledged or template setting of ESlint for our project, we can searching for "eslint-config" on npmjs.com. 

##### Error Level
**Error Level** may be the most important concept with regard to a linter, for ESlint, there are three switches can be set into rules:

- "off" or 0 - turn the rule off
- "warn" or 1 - turn the rule on as a warning
- "error" or 2 - turn the rule on as an error

```
{
    "rules": {
        "semi": ["error", "always"],
        "quotes": ["error", "double"]
    }
}
```


Check [ESlint Official Site](https://eslint.org/docs/user-guide/getting-started) for more information.

## Others
- vim color-esque
- vim-jinja

Some people may not live withouth `vim-css-color`, but for people using neovim, I highly suggest `nvim-colorizer` instead. It is really fast

### common
- `vim-surround`
- `fern` (or `nerdtree`, `defx`, `dirvish`, etc)
