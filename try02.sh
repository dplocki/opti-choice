#!/bin/bash

dir="."
cmd="ls -l $dir"
output=$($cmd)

IFS=$'\n' read -r -d '' -a lines <<< "$output"

for line in "${lines[@]}"; do
    echo "Przetwarzanie: $line"
done
