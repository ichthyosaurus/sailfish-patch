
# GEN-SAILFISH-PATCH 1 "" "gen-sailfish-patch 0.0.1 (2018-11-10)"

## NAME
gen-sailfish-patch - Generate diff and scaffold for SailfishOS patches

## SYNOPSIS
`gen-sailfish-patch` [OPTIONS] ...

## DESCRIPTION
Generate diff for patches and add necessary patch files if they do not exist
(you need to adapt them to your needs and fill out the `TODOs`).

Run `gen_patch.sh` in a git repository, where all the patched qml files reside.
It expects a branch `original` with all original qml files without changes -
in the same directory structure.

Define a prefix for the path if your directory structure does not start with `/`,
by putting the prefix in a file `dir` in the root of your project.

The paths in the resulting diff will be set accordingly.


## OPTIONS
Include options here.

### General Information
`-h, --help`
  Show a short help text and exit. Use `man 1 gen-sailfish-patch` to access this complete manual.

`-V, --version`
  Show version and licensing information about `gen-sailfish-patch`.

## EXAMPLES
Some examples of common usage.

## EXIT STATUS

**0** No problems were encountered.

**1** Any error occurred. `gen-sailfish-patch` was not able to complete the task.

## INSTALLATION
Make sure all external scripts and/or libraries as listed under
**DEPENDENCIES** are properly installed. Then simply put `gen-sailfish-patch` in any
directory listed in your `$PATH` and mark it as executable:

    chmod +x gen-sailfish-patch

To install the manual page, you have to compile it from the Markdown source.
For this, `md2man` can be used, or any other tool at your liking. Then copy
the generated manual page to your local manual directory. Usually something
like the below should do the job:
9
    md2man-roff README.md | gzip -c - > "gen-sailfish-patch.1.gz"
    sudo cp "gen-sailfish-patch.1.gz" "/usr/local/man/man1/gen-sailfish-patch.1.gz"

### Notes

`md2man` is a simple tool to convert Markdown sources to proper manpages.
Install it via

    gem install md2man

or grab the source from <https://github.com/sunaku/md2man>.

## DEPENDENCIES
`gen-sailfish-patch` internally depends on the following external programs, scripts, and/or
libraries. Make sure they are all installed and setup correctly.

* (none)

## BUGS

* (none)

## AUTHOR
Written by Mirian Margiani.

## COPYRIGHT
Copyright (C) 2018  Mirian Margiani

`gen-sailfish-patch` is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

`gen-sailfish-patch` is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
`gen-sailfish-patch`.  If not, see <http://www.gnu.org/licenses/>.

## SEE ALSO
A list of related commands or functions.
