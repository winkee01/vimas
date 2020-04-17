alias ll 'ls -alF'
alias la 'ls -A'

alias c11 'gcc -std=c11 -Wall -O2 -pedantic'
alias g11 'g++ -std=c++17 -Wall -O0 -pedantic'
alias tmux 'tmux -2'
alias cl++ 'clang++ -std=c++11 -Wall -O0 -pedantic'
alias py3 'python3'
alias tn 'tmuxinator'
alias rtv 'rusty-tags vi'
alias cb 'cargo build'
alias cr 'cargo run'
alias cn 'cargo new'
alias cnew 'cargo new'
alias ctest 'cargo test'
alias chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Application aliases
alias gbs 'gitbook serve'
alias gb 'gitbook'


## functions
function reload
    source ~/.config/fish/config.fish
end

function subl
    open -a "Sublime Text.app" $argv
end

function ll
    ls -lhG $argv
end

function la
    ls -lahG $argv
end

function lsd
    ls -d */
end

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert 'notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


