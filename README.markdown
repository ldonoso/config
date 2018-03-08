# VIM

## Installation
cd $home
Just Linux - Install the vim font: sudo apt-get install fonts-inconsolata
    git clone https://github.com/ldonoso/varios
Add the following line to the configuration file: `source ~/varios/vimfiles/_vimrc`
Installing vundle (linux and linux, it doesn't matter the location of the directory .vim):
     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
open vim and execute :BundleInstall

## Tags. Tags files per dir and one global

A local tag file in each directory containing only the tags for source files in that directory, in addition to one single global tag file present in the root directory of your hierarchy, containing all non-static tags present in all source files in the hierarchy.

The advantages of this approach are many:

* All lookups of tag located in the currect directory are fast and the local tag file can be quickly and easily regenerated in one second or less.

* A lookup of a (necessarily non-static) tag found in another directory fails a lookup in the local tag file, but is found in the global tag file, which satisfies all cross-directory lookups.

* The global tag file can be automatically regenerated periodically with a cron job.

### Implementation

Within each of the leaf nodes (i.e. hdrs, lib, src, test) build a tag file:

    find ~/project -type d -exec ~/varios/utils/dirtags.sh {} \;

Build the global tag file, `--file-scope=no` indicates tags scoped only for a single file (static) shouldn't be included in the output: 

    cd ~/project
    ctags -f .tags --file-scope=no -R

or to restrict the processed files:

    ctags -f .tags --file-scope=no -R --languages=C,C++

Configure vim to read the local tag file first, then consult the global tag file when not found in the local tag file:

    :set tags=./.tags,.tags,~/project/.tags 

You can add new routes to link to other projects

The following Vim key mapping is quite useful to rebuild the tag file in the directory of the current source file:

    :nnoremap ,t :!(cd %:p:h; ctags -f .tags *)&

Note: ctags doesn't indexes all kind of symbols (i.e. it doesn't index the local variables by default). You can see which entities are indexed with:

    ctags --list-kinds=c++

# 256 colors terminal
install ncurses-term

Then set the term type in .bashrc with something like the following:
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# tmux
Add the following line to ~/.tmux.conf so it reads our configuration: 
source-file ~/varios/_tmux.conf

# Git

Add to ~/.gitconfig

    [include]
        path = ~/varios/_gitconfig

# ctags

Add to ~/.ctags

   --options=/home/luis.donoso/home_win/src/varios/_ctags


# bashrc
Add the following line to ~/.bashrc so it uses our configuration:
source ~/varios/_bashrc

# Swap caplocks and ctl
www.emacswiki.org/emacs/MovingTheCtrlKey

What it worked for me in Ubuntu 14.04.1 LTS was the http://www.emacswiki.org/emacs/MovingTheCtrlKey#toc9 

# Putty configuration
To get to use 256 colours in putty:
http://blog.sanctum.geek.nz/putty-configuration/

You can tunne the colours used in the shell. For instance, the color for directories was unreadable so I change this in putty:
Window > Colours > ANSI Blue
