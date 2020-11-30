alias c11 'gcc -std=c11 -Wall -O2 -pedantic'
alias g11 'g++ -std=c++17 -Wall -O0 -pedantic'
alias cl11 'clang++ -std=c++11 -Wall -O0 -pedantic'
alias py3 'python3'
alias rtv 'rusty-tags vi'
alias cb 'cargo build'
alias cr 'cargo run'
alias cn 'cargo new'
alias cnew 'cargo new'
alias ctest 'cargo test'
alias tmux 'tmux -2'
alias tn 'tmuxinator'
alias lc 'colorls'
alias ssh 'TERM=xterm-256color ssh'
alias 

# Application aliases
# alias gbs 'gitbook serve'
# alias gb 'gitbook'
# alias chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

## functions
function reload
    source ~/.config/fish/config.fish
end

# fish can not capture multi-line output in a variable
# so if we save the output to a variable and echo that var, new line will lose
# issue: https://github.com/fish-shell/fish-shell/issues/159
function ll
    set lines (env CLICOLOR_FORCE=1 ls -lhtG $argv | awk '/^total/{next;} {print $6" "$7" "$8" "$9}' | wc -l | string trim)
    # set res (env CLICOLOR_FORCE=1 ls -lhtG $argv | awk '/^total/{next;} {print $6" "$7" "$8" "$9}')
    # echo -e $res | less
    # echo $lines
    # echo (tput lines)
    if test $lines -gt (tput lines)
        env CLICOLOR_FORCE=1 ls -lhtG $argv | awk '/^total/{next;} {print $6" "$7" "$8" "$9}' | less -X
        # -X option will prevent clearing the screen
    else
        env CLICOLOR_FORCE=1 ls -lhtG $argv | awk '/^total/{next;} {print $6" "$7" "$8" "$9}'
    end
end

# Works in unix
function ip-addr
    ifconfig en0| grep \"inet[ ]\" | awk '{print \$2}'
end

function la
    env CLICOLOR_FORCE=1 ls -lahtG $argv
end

function lsd
    ls -d */
end

function lt
    env CLICOLOR_FORCE=1 ls -lhtG $argv | tr -d \'\r\' | tail -n +2 | awk '{print $6" "$7" "$8" "$9}'
end

function ltt
    script -q /dev/null ls -lht $argv | tr -d \'\r\' | tail -n +2 | awk '{print $6" "$7" "$8" "$9}'
end

function statl
    stat -f "%m%t%Sm %N" * | sort -rn | cut -f2-
end

function subl
    open -a "Sublime Text.app" $argv
end

function kit
    open -a /Applications/kitty.app
end

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert 'notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

function chrome
  /usr/bin/open -a '/Applications/Google Chrome.app' $argv[1:]
end

function google
  /usr/bin/open -a '/Applications/Google Chrome.app' "https://www.google.co.uk/search?q=$argv[1]"
end
