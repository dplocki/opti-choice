#!/bin/bash

choose_from_menu() {
    local outvar="$1"
    shift
    local options=("$@") cursor=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e")

    while true
    do
        index=0
        for option in "${options[@]}"
        do
            if [ "$index" == "$cursor" ]; then
                echo -e " >\e[7m$option\e[0m"
            else
                echo "  $option"
            fi
            index=$(( $index + 1 ))
        done

        read -s -n3 key

        if [[ $key == $esc[A ]]; then
            cursor=$(( $cursor - 1 ))
            [ "$cursor" -lt 0 ] && cursor=0
        elif [[ $key == $esc[B ]]; then
            cursor=$(( $cursor + 1 ))
            [ "$cursor" -ge $count ] && cursor=$(( $count - 1 ))
        elif [[ $key == "" ]]; then
            break
        fi

        echo -en "\e[${count}A"
    done

    printf -v $outvar "${options[$cursor]}"
}

execute_command() {
    IFS=$'\n' read -r -d '' -a lines <<< "$($1)"
}

get_version_from_line() {
    echo -e "$1" | sed -E 's/^\*?\s*([^ ]+).*/\1/'
}

clean_color_markers() {
    echo -e "$1" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g"
}

cmd="nvm list"
execute_command "$cmd"
choose_from_menu selected_choice "${lines[@]}"
node_version=$(get_branch_from_line "$selected_choice")

nvm use "$node_version"
