#!/bin/bash

files=$(find "$1" -type f -name "*.$2")

    echo "Files with extension .$2 in $1:"
    echo "$files"

