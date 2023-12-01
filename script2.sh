#!/bin/bash

files=$(grep -rl "$2" "$1")

echo "Files containing '$2' in $1:"
echo "$files"
