
# SAILFISH-PATCH 1 "" "sailfish-patch 2.7.0 (2023-04-17)"

## NAME
sailfish-patch - Helper tool for developing SailfishOS patches


## SYNOPSIS

`sailfish-patch` [-c NAME]

`sailfish-patch` [-u [RPMS]]

`sailfish-patch` [-b] [-p] [-Po [latest]] [-Pm [latest]]

`sailfish-patch` [-i CONFIG SOURCE [RPMS]]

`sailfish-patch` [-C|-Cu FILE]

`sailfish-patch` [-S|-S ROUNDS]

`sailfish-patch` [-h] [-V]


## DESCRIPTION

**Creating a new patch:**

Create a new patch skeleton with `-c NAME`. Add a list of source packages in
`CONFIG`, and bootstrap the development with `-u`. Make your changes in `patched`.
Build with `-b`.

Note: instead of defining sources in the `SourcePackages` field of the config
file, you can also manually add sources in the `original` directory. Then copy
everything to the directory `patched` and make your changes.

Running `sailfish-patch -u` later on will update all source files and makes it
easy to adapt the patch to new upstream versions.

Note that it must be possible for `sailfish-patch` to connect to your device via
SSH if you want to use source packages from the official repos. Make sure this
is configured correctly. (This is not needed for OpenRepos sources.)

If you want to add your own settings pages or include translation files,
icons etc. in your patch, you can place them in the `extra` directory.

**Importing an existing patch:**

Importing a patch for which there is a `CONFIG` file is very straightforward: simply
create an empty directory for the patch, drop the `CONFIG` file and the `unified_diff.patch`
file in it, and run `sailfish-patch -u`.

A patch that has no `CONFIG` file can be imported by running `sailfish-patch`
with the `--import` option. Create a new configuration file using
`sailfish-patch -eC > CONFIG`, then specify source packages, patch name, etc.
Finally run `sailfish-patch CONFIG my_patch_file.diff` to create a new bootstrapped
repository. (See above for further details.)

**Tips:**

- Use `rpm -qf /path/to/file` to find out which package a file belongs to.
- Use `pkcon get-details packagename` to check which version is installed.
- Use `sailfish-patch -b -p` to test the patch directly after building (needs ssh).
- Do not push your patch to a public repository. Instead, publish the `code
  distribution package` which includes only the files that belong to you.
  Other users can rebuild the development environment by running
  `sailfish-patch -u` in the published directory. This way, you do not have to
  publish potentially copyrighted material without permission.


## OPTIONS

`-c, --create NAME`
  Create new patch skeleton in NAME

`-b, --build`
  Build RPM and tarball

`-u, --update [RPMS]`
  Update the working directory with the latest sources, or import the patch if only a config file and a patch file called `unified_diff.patch` are found. Update the working directory with the latest sources. This needs a working SSH connection for downloading from official sources, i.e. packages not from OpenRepos. Optionally set `RPMS` to use already downloaded package files from the given directory.

`-p, --publish-ssh`
  Publish and install patch on your device via SSH

`-Po, --publish-openrepos [latest]`
  Wizard for publishing in OpenRepos. (When given `latest` as argument to `-Po`, the wizard will provide info for updating the entry.)

`-Pm, --publish-patchmanager [latest]`
  Wizard for publishing in PM's online catalogue. (See `-Po` for more details.)

`-C, --check-config FILE`
  Validate config file FILE

`-Cu, --config-update FILE`
  Same as `-C`, but update sections automatically (e.g. add new releases to the `CompatibleVersions` section)

`-S, --optimize-screenshots [ROUNDS]`
  Optimize PNG screenshot files of the current project. Optionally specify number of processing rounds for best result (default: 1).

`-i, --import CONFIG SOURCE [RPMS]`
  Setup a new working directory for the given patch. This command is especially useful for importing patches that were not created with this tool. In other cases, `-u` might be more suited for the task. `SOURCE` can either be a tarball containing the patch file (`unified_diff.patch`) in its root, or it can be a patch/diff. Optionally set `RPMS` to use already downloaded package files from the given directory. *Note:* use `-eC` to create a new config file.

`-I, --inspect`
  Only with in combination with `--build`: do not actually build anything to allow inspecting configured build sources (RPM spec, diff, etc.).

`-f, --force`
  Skip some safety checks

### Templates
`-eC, --export-config`
  Export `CONFIG` template

`-eL, --export-license`
  Download/import license text to `COPYING`. Does *not* write to stdout and requires a valid CONFIG file to determine which license text to fetch.

`-eG, --export-gitignore`
  Export `.gitignore` template

`-eI, --export-icon`
  Export OpenRepos icon template

`-eJ, --export-json`
  Export `patch.json` template

`-eS, --export-spec`
  Export RPM spec-file template

`-eQ, --export-qmldetails`
  Export `extra/PatchDetails.qml` template

### Options for development and for debugging
`-R, --check-releases`
  Load a list of SailfishOS releases from the Internet and compare it to the list of versions currently supported

`-g, --use-git-apply`
  Use git-apply(1) instead of patch(1) for applying the patch (see `-i` and `-u`)

### General Information
`-h, --help`
  Show a short help text and exit. Use `man 1 sailfish-patch` to access this complete manual.

`-V, --version`
  Show version and licensing information about `sailfish-patch`.


## CONFIGURATION FILES

Read the sample configuration file provided with this script for detailed documentation.
It can be exported using `sailfish-patch -eC`.

To enable syntax highlighting in KDE's text editor Kate put the syntax highlighting
definition file provided with this script in the following directory:

    $HOME/.local/share/org.kde.syntax-highlighting/syntax/

Some default values can be configured in the file defined by `SF_PATCH_GLOBAL_DEFAULTS`.
An example file will be created if no configuration file is present.
The value of `SF_PATCH_GLOBAL_DEFAULTS` defaults to:

    $HOME/.config/sailfish-patch.conf


## ENVIRONMENT

`SF_PATCH_PASSFILE`
  Path to a local file containing your devel-su passphrase

`SF_PATCH_SSH_TARGET`
  How to connect to your device via ssh (config name or IP)

`SF_PATCH_REMOTE_USERNAME`
  User name to use for deploying and for ssh connections

`SF_PATCH_REMOTE_PATH`
  Path to a directory where patch RPMs will be stored on your device

`SF_PATCH_GLOBAL_DEFAULTS`
  Path to the global configuration file for some default values used in new
  patch config files

`SF_PATCH_LICENSE_CACHE`
  Path to a directory where downloaded license texts are cached


## ADDING NEW CONFIGURATION FIELDS

To add a new configuration field, you have to update the following places:

- `check_default_dummies` array with default dummy value (if necessary)
- `default_config_values` array with default configuration values
  - prefix `s@` for single-line fields and `m@` for multi-line fields
  - use `[sm]@dummy` to use the dummy value as default value
- add the field to the list of required fields in `required_config_values`
- and to the single line or multi line check switches
- add the field to all wizards where it is needed
- if necessary: add the field to `check_allowed_in_global_config`
- add the field to the config file template in `__save_template_config`
- update the Kate syntax file


## UPDATING LIST OF SUPPORTED VERSIONS

This script only supports SailfishOS releases supported by Patchmanager.
To update the list of supported SailfishOS versions, you have to check for new
releases by running:

    sailfish-patch -R

If a version is not marked with 'yes' in the listing above, make sure it is
supported by cross-checking the results with Patchmanager's list at:

    https://coderus.openrepos.net/pm2/upload/

Finally, update the variable `$check_versions` and create a pull request at:

    https://github.com/ichthyosaurus/sailfish-patch


## EXIT STATUS

**0** No problems were encountered.

**>0** Any error occurred.

## INSTALLATION
Make sure all external scripts and/or libraries as listed under
**DEPENDENCIES** are properly installed. Then simply put `sailfish-patch` in any
directory listed in your `$PATH` and mark it as executable:

    chmod +x sailfish-patch

The manual page can be compiled from the Markdown source using tools like
`md2man`, `go-md2man`, etc. Then put the generated manual page into your local
manual directory. Usually something like the following should do the trick:

    go-md2man -in MANPAGE.md | gzip -c - > "sailfish-patch.1.gz"
    mkdir -p ~/.local/share/man/man1 && mv "sailfish-patch.1.gz" -t ~/.local/share/man/man1

### Notes

`md2man` is a Ruby tool to convert Markdown sources to proper manpages.
It is available via `gem install md2man`. Sources are at <https://github.com/sunaku/md2man>.
`go-md2man` is written in Go instead. Sources are at <https://github.com/cpuguy83/go-md2man>.


## DEPENDENCIES
`sailfish-patch` is written purely in `bash` but has the following dependencies:

- patch
- git
- scp
- ssh
- sed
- xclip
- rpm
- rpmbuild
- rpm2cpio
- cpio
- tar
- hxselect
- hxnormalize (from package html-xml-utils)
- du
- numfmt
- html2text (from package python3-html2text)
- pngcrush
- pngquant
- convert (from package imagemagick)


## AUTHOR
Written by Mirian Margiani, originally based on `gen-sailfish-patch` by Cornerman (2016).


## COPYRIGHT
Copyright (C) 2018-2023 Mirian Margiani

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
