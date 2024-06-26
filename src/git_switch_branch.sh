#!/bin/bash

source opti-choice-common.sh

execute_command "git branch --color=always"
choose_from_menu selected_choice "${lines[@]}"
raw_branch_name=$(get_fist_column_ignore_start "$selected_choice")
clean_branch_name=$(clean_color_markers "$raw_branch_name")

git checkout "$clean_branch_name"
