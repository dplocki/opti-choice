#!/bin/bash

source common.sh

execute_command "git br --color=always"
choose_from_menu selected_choice "${lines[@]}"
raw_branch_name=$(get_branch_from_line "$selected_choice")
clean_branch_name=$(clean_color_markers "$raw_branch_name")

git checkout "$clean_branch_name"
