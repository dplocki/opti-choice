#!/bin/bash

source common.sh

execute_command "nvm list"
choose_from_menu selected_choice "${lines[@]}"
node_version=$(get_branch_from_line "$selected_choice")

nvm use "$node_version"
