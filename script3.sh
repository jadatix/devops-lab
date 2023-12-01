#!/bin/bash

directory=""
search_text=""

while getopts "p:s:" opt; do
  case $opt in
    p)
      directory="$OPTARG"
      ;;
    s)
      search_text="$OPTARG"
      ;;
    # \?)
    #     if [ ! -z "$OPTARG" ]; then
    #         echo "Invalid option: -$OPTARG" >&2
    #     fi
    #     exit 1
    #   ;;
    # :)
    #   echo "Option -$OPTARG requires an argument." >&2
    #   exit 1
    #   ;;
  esac
done

if [ -z "$directory" ] || [ -z "$search_text" ]; then
  echo "Usage: $0 -p <directory_path> -s <search_text>"
  exit 1
fi

files=$(grep -rl "$search_text" "$directory")

echo "Files containing '$search_text' in $directory:"
echo "$files"
