#!/bin/sh

#######color define########
RED="31m"      # Error
GREEN="32m"    # Success
YELLOW="33m"   # Warning
BLUE="36m"     # Info

ASK="false"
ISNVIM="false"
CLONE="true"
METHOD="symlink"
PROJ="vimas"
nvim="$HOME/.config/nvim"

plug_path=$HOME/.vim/autoload/plug.vim
plug_installer=$HOME/.vim/install.vim

colorEcho(){
    echo "\033[${1}${@:2}\033[0m" 1>& 2
}

get_date() {
    local DATE=$(date +%Y-%m-%d"_"%H-%M-%S);
    echo $DATE
}

check_files() {
    for f in "$@"; do
        if [[ ! -e $f ]]; then
            colorEcho $RED "error: $f does not exist! exit."
            return 1
        fi
    done
}

# if current dir is not the project dir, pull the project
clone_project() {
    [ "${PWD##*/}" = "$PROJ" ] && export CLONE="false"
    if [ -e "$PWD/$PROJ" ]; then
        colorEcho $BLUE "$PWD/$PROJ already exists, enter $PWD/$PROJ"
        cd $PROJ
    else
        if [ "$CLONE" = "true" ]; then
            colorEcho $BLUE "$PROJ project does not exist, downloading it from github"
            git clone --depth=1 https://github.com/winkee01/$PROJ.git
            if [ ! "$?" = 0 ]; then
                colorEcho $RED "Failed!"
                exit 1
            fi
            cd "$PROJ"
        fi
        colorEcho $BLUE "Now we are in project directory, ready to install the configurations."
    fi
}

install_plugins() {
    if [ ! -e $plug_path ]; then
        curl -fLo $plug_path --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    vim --noplugin -u $plug_installer -N +PlugClean +PlugInstall! +qall
}

install_files() {
    arg1=("$@") # expand to an array. e.g. "install_file git/*" -> ["git/gitignore", "git/gitconfig"]
    shift
    arg2=("$@") # parse as an argument

    if [[ -n $arg2 ]]; then
        case $1 in
            -s|--symlink)
            METHOD="symlink"
            ;;
            -c|--copy)
            METHOD="copy"
            ;;
            *)
            # unkonwn argument
            ;;
        esac
        shift
    else
        # reset to default
        METHOD="symlink"
    fi

    name=${arg1[0]%/*}
    [ "$ASK" = "true" ] && read -p "Install $name configurations?(y/n, default y):" install
    install=${install:-"y"}
    case "${install}" in
        "y")
            for f in ${arg1}; do
                fbase=${f##*/}
                source=$PWD/$name/$fbase
                target=$HOME/.$fbase

                if [[ ! -e $source ]]; then
                    colorEcho $RED "error: $source does not exist."
                    return
                fi

                if [[ (-e $target) && ((! -L $target) || (-L "$target" && ! `readlink $target` == $source)) ]]; then
                    #echo "target already exists, and it's not a symlink or it's a symlink but not point to source"
                    # bak=$(get_date)
                    [ "$ASK" = "true" ] && read -p "backup, override, cancel? (1/2/3, default 1):" choice
                    choice=${choice:-"1"}

                    case ${choice} in
                        1)
                            bak="bak"
                            colorEcho $BLUE "backing up: $target -> ${target}.$bak"
                            mv $target ${target}.$bak
                        ;;
                        2)
                            rm -rf $target
                        ;;
                        3)
                            return
                        ;;
                        *)
                        ;;
                    esac
                fi

                if [[ $METHOD == "symlink" ]]; then
                    colorEcho $BLUE "linking: $source -> $target"
                    ln -nfs $source $target
                elif [[ $METHOD == "copy" ]]; then
                    colorEcho $BLUE "coping: $source -> $target"
                    cp -Rf $source $target
                else
                    colorEcho $RED "Wrong method!"
                    exit 1
                fi
            done
            break
            ;;
        *)
            return
            ;;
    esac

    # Automatically install the plugins of vim
    if [ "$name" = "vim" ]; then
        colorEcho $BLUE "Install plugins...."
        install_plugins
        colorEcho $GREEN "Plugins are installed successfully!"
    fi
    colorEcho $GREEN "$name configurations are installed successfully!"
}

install_nvim() {
    echo "Install only Neovim configurations ..."
    [ "$ISNVIM" = "true"  ] || read -p "Install Neovim configurations?(y/n, default y):" ins_nvim
    ins_nvim=${ins_nvim:-"y"}

    case "${ins_nvim}" in
        "y")
            source=$PWD/nvim
            target=$nvim

            if [[ ! -e $source ]]; then
                colorEcho $RED "error: $source does not exist."
                return
            fi

            if [[ (-e $target) && ((! -L $target) || (-L "$target" && ! `readlink $target` == $source)) ]]; then
                #echo "target already exists, and it's not a symlink or it's a symlink but not point to source"
                bak=$(get_date)
                # bak="bak"
                colorEcho $BLUE "backing up: $target -> ${target}.$bak"
                mv $target ${target}.$bak
            fi

            parentdir=${target%/nvim}
            if [[ ! -e  $parentdir ]]; then
                colorEcho $BLUE "creating $parentdir"
                mkdir -p $parentdir
            fi

            colorEcho $BLUE "copying: $source -> $target"
            cp -r $source $target
            colorEcho $GREEN "Neovim configurations are installed successfully."

            break
            ;;
        *)
            return
            ;;
    esac
}

# drain options
while [[ $# > 0 ]]; do
  case "$1" in
      -a|--ask)
      ASK="true"
      ;;
      nivm)
      ISNVIM="true"
      ;;
      *)
        # unknown option
      ;;
  esac
  shift
done

main() {
    if [ "$ISNVIM" = "true" ]; then
        install_nvim
        exit 0
    fi

    clone_project
    install_files "git/*" --copy
    install_files "ctags/*" --copy
    install_files "tmux/*"
    install_files "vim/*"
}

main $1
