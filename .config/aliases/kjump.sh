# Fast travel
alias j='jump_directory'

jump_directory() {
        if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
                echo "=== Available Jumps ==="
                echo ''
                #echo 'Windows:'
                #echo "  - wdl: $WIN_USER_HOME/Downloads"
                #echo "  - rep: $WIN_USER_HOME/source/repos"
                #echo "  - progdata: /mnt/c/ProgramData"
                #echo "  - roam: $WIN_USER_HOME/AppData/Roaming/"
                #echo 'Linux:'
                echo "- conf: $XDG_CONFIG_HOME"
                echo "- zsh: $ZDOTDIR"
                echo "- alias: $XDG_CONFIG_HOME/aliases"
                echo "- dl: $HOME/Downloads"
                echo "- work: $WORKSPACE"
        # Windows
        #elif [ "$1" = "wdl" ]; then cd $WIN_USER_HOME/Downloads
        #elif [ "$1" = "rep" ]; then cd $WIN_USER_HOME/source/repos
        #elif [ "$1" = "progdata" ]; then cd /mnt/c/ProgramData
        #elif [ "$1" = "roam" ]; then cd $WIN_USER_HOME/AppData/Roaming
        # Linux
        elif [ "$1" = "conf" ]; then cd $XDG_CONFIG_HOME
        elif [ "$1" = "zsh" ]; then cd $ZDOTDIR
        elif [ "$1" = "alias" ]; then cd $XDG_CONFIG_HOME/aliases
        elif [ "$1" = "dl" ]; then cd $HOME/Downloads
        elif [ "$1" = "work" ]; then cd $WORKSPACE
        else echo "Failed to teleport to $1 (hint: j -h)"
        fi
}
