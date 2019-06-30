
# SAILFISH-PATCH 1 "" "sailfish-patch 1.1.0 (2019-05-09)"

## NAME
sailfish-patch - Generate diff and scaffold for SailfishOS patches

## SYNOPSIS
`sailfish-patch` [OPTIONS] ...

## DESCRIPTION

Generate diff for patches and add necessary patch files if they do not exist
(you need to adapt them to your needs and fill out the 'TODOs').

Run '$script' in a git repository, where all the patched
QML files reside. It expects a branch 'original' with all original qml
files without changes in the same directory structure.

Define a prefix for the path if your directory structure does not start with '/'
by putting the prefix in a file 'build/dir' in the root of your project.

The paths in the resulting diff will be set accordingly.

Note: the script has to be run in the root directory of your project.

Warning: the script has to be adapted for the publish feature to work in your setup!


## OPTIONS
`-b, --build`
  build RPM

`-p, --publish`
  publish and install patch (remotely on device)

### General Information
`-h, --help`
  Show a short help text and exit. Use `man 1 sailfish-patch` to access this complete manual.

`-V, --version`
  Show version and licensing information about `sailfish-patch`.

## EXIT STATUS

**0** No problems were encountered.

**>0** Any error occurred.

## INSTALLATION
Make sure all external scripts and/or libraries as listed under
**DEPENDENCIES** are properly installed. Then simply put `sailfish-patch` in any
directory listed in your `$PATH` and mark it as executable:

    chmod +x sailfish-patch

To install the manual page, you have to compile it from the Markdown source.
For this, `md2man` can be used, or any other tool at your liking. Then copy
the generated manual page to your local manual directory. Usually something
like the below should do the job:
9
    md2man-roff README.md | gzip -c - > "sailfish-patch.1.gz"
    sudo cp "sailfish-patch.1.gz" "/usr/local/man/man1/sailfish-patch.1.gz"

### Notes

`md2man` is a simple tool to convert Markdown sources to proper manpages.
Install it via

    gem install md2man

or grab the source from <https://github.com/sunaku/md2man>.

## DEPENDENCIES
`sailfish-patch` internally depends on the following external programs, scripts, and/or
libraries. Make sure they are all installed and setup correctly.

* git
* sed
* private-mount
* private-umount
* scp
* ssh
* rpmbuild

## AUTHOR
Written by Mirian Margiani based on `sailfish-patch` by Cornerman.

## COPYRIGHT
Copyright (C) 2016  Cornerman, 2018-2019  Mirian Margiani

`sailfish-patch` is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

`sailfish-patch` is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
`sailfish-patch`.  If not, see <http://www.gnu.org/licenses/>.
