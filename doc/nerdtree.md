1. mappings
nerdtree is remapped as `nnoremap <silent> <C-\> :call OpenNerdTree()<CR>`
therefore, we can call ctrl + '\' to toggle nerdtree.

2. add/delete file
press m to open menu, and affliate the below key to make the corresponding operations.

```
  (a)dd a childnode
  (m)ove the current node
  (d)elete the current node
  (r)eveal in Finder the current node
  (o)pen the current node with system editor
  (q)uicklook the current node
  (c)opy the current node
  copy (p)ath to clipboard
  (l)ist the current node
```

for example, ma will create a new file under the cursor position.
