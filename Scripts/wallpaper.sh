#!/bin/bash

if [[ -d $1 ]]; then
  files=(${1}/*.{png,jpg})

  # Make sure that all files are correct
  for i in ${files[@]}; do
    if [[ -f $i ]]; then
      wanted=("${wanted[@]}" "$i")
    fi
  done

  # Select random file
  result="${wanted[RANDOM % ${#wanted[@]}]}"
elif [[ -f $1 ]]; then
  # Get extension
  extension="${1##*.}"

  # Make sure that it's correct image
  if [[ $extension =~ png|jpg ]]; then
    result="$1"
  fi
fi

# Set wallpaper
if [[ -e $result ]]; then
  hsetroot -fill "$result"
else
  echo "Can't set wallpaper"
fi
