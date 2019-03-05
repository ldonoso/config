# Tag files

We'll have a local tag file in each directory containing only the tags for source files in that directory, in addition to one single global tag file present in the root directory of your hierarchy, containing all non-static tags present in all source files in the hierarchy.

The advantages are:

* All lookups of tag located in the currect directory are fast and the local tag file can be quickly and easily regenerated in one second or less.

* A lookup of a (necessarily non-static) tag found in another directory fails a lookup in the local tag file, but is found in the global tag file, which satisfies all cross-directory lookups.

* The global tag file can be automatically regenerated periodically with a cron job.

## Implementation

Within each of the leaf nodes (i.e. hdrs, lib, src, test) build a tag file:

``` shell
find ~/project -type d -exec ~/config/utils/dirtags.sh {} \;
```

Build the global tag file, `--file-scope=no` indicates tags scoped only for a single file (static) shouldn't be included in the output:

``` shell
cd ~/project
ctags -f .tags --file-scope=no -R
```

or to restrict the processed files:

``` shell
ctags -f .tags --file-scope=no -R --languages=C,C++
```

Configure vim to read the local tag file first, then consult the global tag file when not found in the local tag file:

```
:set tags=./.tags,.tags,~/project/.tags
```

You can add new routes to link to other projects

The following Vim key mapping is quite useful to rebuild the tag file in the directory of the current source file:

```
:nnoremap ,t :!(cd %:p:h; ctags -f .tags *)&
```

Note: ctags doesn't indexes all kind of symbols (i.e. it doesn't index the local variables by default). You can see which entities are indexed with:

``` shell
ctags --list-kinds=c++
```
