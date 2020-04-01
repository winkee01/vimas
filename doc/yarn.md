
### Introduction

If yarn is not installed in your system, you will see an error message saying:

```
[coc.nvim] javascript file not found, please compile the code or use release branch.
```

Install yarn with the below command.

```shell
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

```

then, build the required lib:

```
cd ~/.vim/plugged/coc.nvim
yarn install
```

or you can simple do:

```shell
:call coc#util#install()
```

Reference:
https://github.com/neoclide/coc.nvim/issues/651