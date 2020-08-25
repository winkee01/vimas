### 1. fish config

Place fish config files into `~/.config/fish/`

example:
```shell
~/.config/fish/aliases.fish
~/.config/fish/config.fish
```

Remember:
In `config.fish`, we should add `source aliases.fish`


### 2. fishmark

we can install fishmark to fasten the jump between directories.

fishmark
(1) automatic install
curl -L https://github.com/techwizrd/fishmarks/raw/master/install.fish | fish
(2) manual install
$ git clone http://github.com/techwizrd/fishmarks.git ~/.fishmarks
then, add the below line into ~/.config/fish/config.fish

```
source ~/.fishmarks/marks.fish
```

bashmark / fishmark usage:

```
s <bookmark_name> - Saves the current directory as "bookmark_name"
g <bookmark_name> - Goes/cd to the directory associated with "bookmark_name"
p <bookmark_name> - Prints the directory associated with "bookmark_name"
d <bookmark_name> - Deletes the bookmark
l - Lists all available bookmarks'
```