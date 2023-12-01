#!/bin/bash

file_counts=$(find "$1" -type f -name "*.$2" | wc -l)

echo "Number of files ending with .$2 in $1: $file_counts"