#!/bin/sh

cd "$1"
ctags --languages='C++' -f .tags *
