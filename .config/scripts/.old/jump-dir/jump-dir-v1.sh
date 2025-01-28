#!/usr/bin/env zsh

# WARNING: This has been made to run in the Z shell.
# The reason is that enumerating associative arrays in ZSH is not the same as in Bash because of the '!' character.
# For more info, checkout this post: https://unix.stackexchange.com/a/150041
# You can easily convert this script to make it work with Bash instead by changing the for loop in help section.
# Note to self: If I ever need to work with arrays in the future, I should pick a real programming language...

function jump_dir_v1() {
        jumps_file="$SCRIPTS/jump-dir/jumps.txt"

        # Read jumps from file
        declare -A jumps
        while read -r line; do
                id=$(echo $line | cut -d':' -f1)
                jpath=$(echo $line | cut -d':' -f2)

                jumps[$id]="$jpath"
        done <$jumps_file

        # Show help if no arg or if arg is --help or -h
        if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
                echo -e "=== Available Jumps ===\n"

                # WARNING: This part will either work or not depending on your shell. Adapt it in case.
                # for id in "${!jumps[@]}"; do # bash only
                for id in "${(@k)jumps}" ; do # zsh only
                        echo " - $id: ${jumps[$id]}"
                done
                echo ''
        else
                # Attempt jump
                id=$1
                if [ "${jumps[$id]+abc}" ]; then
                        jpath_raw=${jumps[$id]}
                        jpath=$(eval "echo $jpath_raw")
                        cd "$jpath"
                else
                        echo "Teleport failed: '$id' is not valid (hint: j -h)" >&2
                fi
        fi
}
