#!/bin/bash

files=($1/*.{png,jpg})

# Make sure that all files are correct
for i in ${files[@]}; do
  if [[ -f "$i" ]]; then
    wanted=("${wanted[@]}" "$i")
  fi
done

result="${wanted[RANDOM % ${#wanted[@]}]}"

hsetroot -fill "$result"
