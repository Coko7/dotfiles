#!/usr/bin/env bash

function jump_dir() {
    # Display help if "--help" or "-h" supplied
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: jump_dir [OPTION] [DESTINATION]"
        echo "Attempts to change directory to DESTINATION"
        echo "Supply no argument to use in interactive mode (fzf)"
        echo "Example: jump_dir downloads\n"
        echo "Options:"
        echo "\t-h, --help      display this help text and exit"      
        echo "\t-v, --version   display version information and exit"
        # echo "\t-s, --silent    do not ouput error messages"
        return 0
    fi

    if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
        echo "jump_dir 3.0"
        echo "Starting with 3.0, fzf is used even for non interactive mode."
        return 0
    fi

    jumps_file="$SCRIPTS/jump-dir/jumps.txt"

    # If $1 is set, then fzf will not be launched interactively
    fzf_filter_suffix="-f $1"
    if [ -z "$1" ]; then
        fzf_filter_suffix=""
    fi

    # Find all subdirs of dirs from the jumps_file and hide errors from output
    all_dirs=`find $(cat $jumps_file | envsubst) -mindepth 1 -maxdepth 1 -type d 2>/dev/null`
    # NOTE: Had a lot of trouble with the find command in zsh, see:
    # - https://unix.stackexchange.com/questions/417629/pass-a-list-of-directories-stored-in-a-file-to-find-command
    # - https://stackoverflow.com/questions/73206662/executing-find-command-with-a-file-having-directory-list
    # Starting with GNU findutils 4.9.0, the more reliable `file0-from` argument may be used
    # to pass a list of starting points to the find command. See:
    # - https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00003.html

    # Use fzf to find a destination and only keep the first match if several results
    destination=`echo $all_dirs | fzf $fzf_filter_suffix | head -n 1`
    if [ -z $destination ]; then
        # echo "jump_dir failed: no match found for '$id'"
        return 1
    fi

    cd $destination
}
