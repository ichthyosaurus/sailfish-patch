
# PROJECTCAPS 1 "" "PROJECT 0.0.1 (DATE)"

## NAME
PROJECT - one-line description of what it does

## SYNOPSIS
`PROJECT` [OPTIONS] ...

## DESCRIPTION
A textual description of the functioning of the command or function.

## OPTIONS
Include options here.

### General Information
`-h, --help`
  Show a short help text and exit. Use `man 1 PROJECT` to access this complete manual.

`-V, --version`
  Show version and licensing information about `PROJECT`.

## EXAMPLES
Some examples of common usage.

## EXIT STATUS

**0** No problems were encountered.

**1** Any error occurred. `PROJECT` was not able to complete the task.

## INSTALLATION
Make sure all external scripts and/or libraries as listed under
**DEPENDENCIES** are properly installed. Then simply put `PROJECT` in any
directory listed in your `$PATH` and mark it as executable:

    chmod +x PROJECT

To install the manual page, you have to compile it from the Markdown source.
For this, `md2man` can be used, or any other tool at your liking. Then copy
the generated manual page to your local manual directory. Usually something
like the below should do the job:
9
    md2man-roff README.md | gzip -c - > "PROJECT.1.gz"
    sudo cp "PROJECT.1.gz" "/usr/local/man/man1/PROJECT.1.gz"

### Notes

`md2man` is a simple tool to convert Markdown sources to proper manpages.
Install it via

    gem install md2man

or grab the source from <https://github.com/sunaku/md2man>.

## DEPENDENCIES
`PROJECT` internally depends on the following external programs, scripts, and/or
libraries. Make sure they are all installed and setup correctly.

* (none)

## BUGS

* (none)

## AUTHOR
Written by Mirian Margiani.

## COPYRIGHT
Copyright (C) YEAR  Mirian Margiani

`PROJECT` is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

`PROJECT` is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
`PROJECT`.  If not, see <http://www.gnu.org/licenses/>.

## SEE ALSO
A list of related commands or functions.
