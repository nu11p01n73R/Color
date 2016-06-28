#!/usr/local/bin/bash

BASE16_PATH="$HOME/programs/shell/base16-shell"

#
# List all the available colors in the format
# color - background
# Color names correspond to their shell files in $BASE16_PATH
#
function list_all()
{
    scheme_files="${BASE16_PATH}/*.sh"

    echo
    echo "Available Color Schemes With Background"
    echo
    for file in $scheme_files
    do
        echo -e $file | sed "s#${BASE16_PATH}/base16-\([^.]*\).\(.*\).sh#\\1 - \\2#"
    done | column
}


#
# Entry script to color.
#
function color()
{
    #
    # List the colors if the first argument is list.
    #
    if [[ $1 == "list" ]]
    then
        list_all
    fi 
}
