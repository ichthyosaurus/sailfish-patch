
# SAILFISH-PATCH 1 "" "sailfish-patch 2.0.0 (2019-06-29)"

## NAME
sailfish-patch - Manage your SailfishOS patches

## SYNOPSIS
`sailfish-patch` [-c NAME]
`sailfish-patch` [-b] [-p] [-Po] [-Pm]
`sailfish-patch` [-C FILE]
`sailfish-patch` [-h] [-V]


## DESCRIPTION

Create a new patch skeleton with '-c NAME' and put the original files
in the new Git branch 'original'. Copy everything to the branch 'master' and
make your changes. Configure the project in 'build/CONFIG'. Build with '-b'.

Note: separate settings pages are currently only supported via Patchmanager.


## OPTIONS

`-c, --create NAME`
  Create new patch skeleton in NAME

`-C, --check-config FILE`
  Validate config file FILE

`-b, --build`
  Build RPM and tarball

`-p, --publish-ssh`
  Publish and install patch on your device via ssh

`-Po, --publish-openrepos`
  Wizard for publishing in OpenRepos

`-Pm, --publish-patchmanager`
  Wizard for publishing in PM's online catalogue

### General Information
`-h, --help`
  Show a short help text and exit. Use `man 1 sailfish-patch` to access this complete manual.

`-V, --version`
  Show version and licensing information about `sailfish-patch`.


## CONFIGURATION FILES

Read the sample configuration file provided with this script for detailed documentation.

To enable syntax highlighting in KDE's text editor Kate put the syntax highlighting
definition file provided with this script in the following directory:

  $HOME/.local/share/org.kde.syntax-highlighting/syntax/

## ENVIRONMENT

`SF_PATCH_PASSFILE`
  Path to a local file containing your devel-su passphrase

`SF_PATCH_SSH_TARGET`
  How to connect to your device via ssh (config name or IP)

`SF_PATCH_REMOTE_PATH`
  Path to a directory where patch RPMs will be stored on your device

## ADDING NEW CONFIGURATION FIELDS

To add a new configuration field, you have to update the following places:

- check_defaults array with default dummy value (if necessary)
- add the field to the list of required fields
- and to the single line or multi line check switches
- add the field to all wizards where it is needed
- update the Kate syntax file

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
* scp
* ssh
* rpmbuild
* xclip
* tar

## AUTHOR
Written by Mirian Margiani, originally based on `gen-sailfish-patch` by Cornerman.

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
