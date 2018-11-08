#!/bin/bash

script_full_path=$(dirname "$0")

cd "$1"

# Generate a tags file in every directory
find . -type d -exec $script_full_path/dirtags.sh {} \;

# Generate a global one
ctags --exclude=.git --file-scope=no -R -f .tags 

