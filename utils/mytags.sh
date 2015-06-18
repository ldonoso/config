#!/bin/bash

cd $1

find . -type d -exec ~/varios/utils/dirtags.sh {} \;

ctags -f .tags --file-scope=no -R

