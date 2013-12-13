#!/bin/bash

files=($1/*)
echo "${files[RANDOM % ${#files[@]}]}"
