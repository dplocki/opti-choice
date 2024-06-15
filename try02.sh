#!/bin/bash

function execute_command() {
    local output="$($1)"
    IFS=$'\n' read -r -d '' -a lines <<< "$output"
}

dir="."
cmd="git br"

execute_command "$cmd"

for line in "${lines[@]}"; do
    echo "Przetwarzanie: $line"
done
