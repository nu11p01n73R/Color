#!/usr/loca/bin/bash

LINK_FILE="$HOME/.color"

#
# List all the available colors in the format
# color-background
# Color names correspond to their shell files in $BASE16_PATH
#
function list_all()
{ 
        scheme_files="${BASE16_SHELL}/scripts/*.sh"
        for file in $scheme_files
        do
                get_color_name "$file"
        done | column
}

function get_color_name()
{
        echo -e $1 | sed "s#${BASE16_SHELL}/scripts/base16-\([^.]*\).sh#\\1#"
}

function link_scheme()
{
        scheme_file="${BASE16_SHELL}/scripts/base16-$1.sh"
        if [[ ! -f "$scheme_file" ]]
        then
               echo "Scheme file not found" 
               return 1
        fi

        ln -fs "$scheme_file" "$LINK_FILE" 
}

function load_scheme()
{
        link_scheme $1 && source "$LINK_FILE"
}

function reload_scheme()
{
        source "$LINK_FILE"
}

function current_scheme()
{
        if [[ ! -f "$LINK_FILE" ]]
        then
                echo "No color scheme available"
                return
        fi

        echo -n "Current Color Scheme : "
        scheme_file=$(readlink $LINK_FILE)
        get_color_name "$scheme_file"
}

function demo()
{
        scheme_files="${BASE16_SHELL}/scripts/*.sh"
        for file in $scheme_files
        do
                echo -n "Scheme : "
                get_color_name $file
                source $file
                sleep 2
        done
}

if [[ $1 == "list" ]]
then
        list_all
elif [[ $1 == "demo" ]]
then
        demo
elif [[ $1 == "reload" ]]
then
        reload_scheme
elif [[ ! -z $1 ]] 
then
        load_scheme $1
else
        current_scheme
fi
