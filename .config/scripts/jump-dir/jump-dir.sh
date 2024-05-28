#!/usr/bin/env zsh

function jump_dir() {
        # Display help if "--help" or "-h" supplied
        if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
                echo "Usage: jump_dir [OPTION] [DESTINATION]"
                echo "Attempts to change directory to DESTINATION"
                echo "Supply no argument to use in interactive mode (fzf)"
                echo "Example: jump_dir downloads\n"
                echo "Options:"
                echo "\t-h, --help      display this help text and exit"      
                return 0
        fi

        jumps_file="$SCRIPTS/jump-dir/jumps.txt"

        # envsubst is used to substitute env variables with their actual value
        jumps=`cat $jumps_file | envsubst`

        # If no arg supplied, go into interactive mode with fzf
        if [ -z "$1" ]; then
                jump_entry=`echo $jumps | fzf`
                if [ $? != 0 ]; then
                        return 1
                fi

                jump_location=`echo $jump_entry | cut -d':' -f2 | tr -d '[:blank:]'`
                cd $jump_location
        else
        # Attempt jump
                id=$1

                jump_entry=`echo $jumps | grep "^$id:"`
                if [ $? != 0 ]; then
                        echo "jump_dir failed: '$id' is not a valid destination"
                        return 1
                fi

                jump_location=`echo $jump_entry | cut -d':' -f2 | tr -d '[:blank:]'`
                cd $jump_location
        fi
}
