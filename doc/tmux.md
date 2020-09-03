
prefix: ctrl + a

switch session: prefix + )
switch window: prefix + p/n
switch pane: prefix + i/j/k/l
swap pane: prefix + [/]

horizontal split
prefix + " or prefix + -

vertical split
prefix + % or prefix + |


List mapping:
prefix + >
prefix + <

List history:
prefix + shift + ~

d  detach
t  big clock
?  list shortcuts
:  prompt

attach:
tmux + a

### Copy mode
Pressing PREFIX [ places us in Copy mode. We can then use our movement keys to move our cursor around the screen. By default, the arrow keys work. we set our configuration file to use Vim keys for moving between windows and resizing panes so we wouldn’t have to take our hands off the home row. tmux has a vi mode for working with the buffer as well. To enable it, add this line to `~/.tmux.conf`:

```
setw -g mode-keys vi
```

With this option set, we can use h, j, k, and l to move around our buffer.

### pane
show pane number
prefix + q

mark a pane
prefix + m
unmark a pane
prefix + M

To target the marked pane you can use -t '~' or -t '{marked}'.
In this case it is simply a matter of send -t '~' <keys here>.
A more generic way to get the marked pane in your shell would be tmux display -p -t `'~'` `'#D'`.

toggle pane zoom
prefix + z

sync panes
:setw synchronize-panes

### window
swap window
:swap-window -s [winNo] -t [winNo]

### status line
```
Session: [SessionNo][WindowNo][PaneNo]
```

command to get current window number?
:display-message -p '#I'
:display-message

toggle layout
prefix + space

reference:
https://gist.github.com/MohamedAlaa/2961058
