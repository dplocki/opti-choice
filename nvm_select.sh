#!/bin/bash

source opti-choice-common.sh

execute_command "nvm list"
choose_from_menu selected_choice "${lines[@]}"
node_version=$(get_fist_column_ignore_start "$selected_choice")

nvm use "$node_version"
