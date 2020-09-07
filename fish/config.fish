# if status --is-interactive
#     set BASE16_SHELL "$HOME/.config/base16-shell/"
#     source "$BASE16_SHELL/profile_helper.fish"
# end
if test -f ~/.fishmarks/marks.fish;
    source ~/.fishmarks/marks.fish;
end

if test -f ~/.config/fish/aliases.fish;
    source ~/.config/fish/aliases.fish;
end

set -gx LC_ALL en_US.UTF-8
# set -Ux LANG en_US.UTF-8

set -gx FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

#set -gx LLVM_HOME /opt/llvm
#set -gx LD_LIBRARY_PATH /usr/local/lib:/opt/llvm/lib $LD_LIBRARY_PATH:
set -gx EDITOR '/usr/bin/vim'
set -gx CHEATCOLORS 'true'
set -gx GOROOT '/usr/local/go'
set -gx GOPATH $HOME/dev/goll
set -gx GOBIN $GOPATH/bin
set -gx GO111MODULE 'on'

set -gx RUSTBIN $HOME/.cargo/bin
set -gx MYSQLCLI /usr/local/mysql-shell-8.0.19-macos10.15-x86-64bit/bin

set -gx GTAGSLABEL native-pygments
set -gx GTAGSCONF /usr/local/share/gtags/gtags.conf
set -gx RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/
# rustc --print sysroot

set -gx CABALBIN $HOME/.cabel/bin
set -gx GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx GHCUPBIN $HOME/.ghcup/bin
# source $HOME/.ghcup/env

set -gx PATH $CLANGD/bin $RUSTBIN $GOROOT/bin $GOBIN \
 $MYSQLCLI ~/bin /usr/local/aria2/bin/ $CABALBIN $GHCUPBIN $PATH

# set -gx PATH  $PATH
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# maintain ls color on pipe
export CLICOLOR=1 
export LSCOLORS=gxcxdxdxbxxxxxbxbxgxgx

if test -f ~/.autojump/share/autojump/autojump.fish;
    source ~/.autojump/share/autojump/autojump.fish;
end

# if test -z (pgrep ssh-agent)
# eval (ssh-agent -c)
#     set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#     set -Ux SSH_AGENT_PID $SSH_AGENT_PID
#     set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
# end

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# setup boost
set -gx C_INCLUDE_PATH $C_INCLUDE_PATH
set -gx CPLUS_INCLUDE_PATH /usr/local/include/boost-1_72 $CPLUS_INCLUDE_PATH
set -gx LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH
set -gx LIBRARY_PATH /usr/local/lib $LIBRARY_PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; . '$HOME/google-cloud-sdk/path.fish.inc'; end
