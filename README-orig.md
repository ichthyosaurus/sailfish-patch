# Generate diff and scaffold for SailfishOS patches

Generate diff for patches and add necessary patch files if they do not exist
(you need to adapt them to your needs and fill out the `TODOs`).

Run `gen_patch.sh` in a git repository, where all the patched qml files reside.
It expects a branch `original` with all original qml files without changes -
in the same directory structure.

Define a prefix for the path if your directory structure does not start with `/`,
by putting the prefix in a file `dir` in the root of your project.

The paths in the resulting diff will be set accordingly.
