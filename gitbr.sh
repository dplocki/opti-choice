#!/bin/bash

choose_from_menu() {
    local outvar="$1"
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e")

    while true
    do
        index=0
        for option in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\e[7m$option\e[0m"
            else echo "  $option"
            fi
            index=$(( $index + 1 ))
        done
        read -s -n3 key
        if [[ $key == $esc[A ]]
        then cur=$(( $cur - 1 ))
            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]]
        then cur=$(( $cur + 1 ))
            [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]]
        then break
        fi
        echo -en "\e[${count}A"
    done

    printf -v $outvar "${options[$cur]}"
}

execute_command() {
    local output="$($1)"
    IFS=$'\n' read -r -d '' -a lines <<< "$output"
}

get_branch_from_line() {
    echo -e "$1" | sed -E 's/^\*?\s*([^ ]+).*/\1/'
}

clean_color_markers() {
    echo -e "$1" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g"
}

cmd="git br --color=always"
execute_command "$cmd"
choose_from_menu selected_choice "${lines[@]}"
raw_branch_name=$(get_branch_from_line "$selected_choice")
clean_branch_name=$(clean_color_markers "$raw_branch_name")

git checkout "$clean_branch_name"
