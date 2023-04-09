
# sailfish-patch

`sailfish-patch` is a helper tool for developing SailfishOS patches.

Create a new patch skeleton with `-c NAME`.
Add a list of source packages in `CONFIG`, and bootstrap the development with `-u`.
Make your changes in `patched`.
Build with `-b`.

For updating the patch to new upstream versions, simply run `sailfish-patch -u`.

If you want to add your own settings pages or include translation files,
icons etc. in your patch, you can place them in the `extra` directory.

# Short how-to

## Creating a new patch

1. configure the patch by editing `CONFIG`
    - add all source packages to the `SourcePackages` field
    - update basic info about the patch
    - run `sailfish-patch -C` to check for configuration mistakes
2. bootstrap sources by running `sailfish-patch -u`
    - note: it must be possible for `sailfish-patch` to connect to your device via
      SSH if you want to use source packages from the official repos. Make sure
      this is configured correctly. This is not needed for OpenRepos sources.
    - alternatively, put original sources in `original/` and copy them to `patched/`
3. commit clean sources
4. make any changes in `patched/`

5. optionally: add extra files like translations, icons, or settings to the `extra/` directory
    - allowed file extensions: `.qml`, `.js`, `.png`, `.svg`, `.qm`
    - translations files must be named `translation_LANG.qm`
    - patch icon must be named `main.png` (`main-light.png`) or `main.svg` (`main-light.svg`)
    - patch settings page must be named `main.qml`
    - no sub-directories are allowed
    - see https://coderus.openrepos.net/pm2/usage/ for further details

6. run `sailfish-patch -b` to build, use `-p` to test it directly via SSH
7. publish it to [OpenRepos](openrepos.net) and [the web catalog](https://coderus.openrepos.net/pm2/)
   using the wizards: `sailfish-patch -Po -Pm`
8. update the patch to new upstream versions by running `sailfish-patch -u`

Tips:

- Use `rpm -qf /path/to/file` to find out which package a file belongs to.
- Use `pkcon get-details packagename` to check which version is installed.
- Use `sailfish-patch -b -p` to test the patch directly after building (needs SSH).
- Do not push your patch to a public repository. Instead, publish the `code
  distribution package` which includes only the files that belong to you.
  Other users can rebuild the development environment by running
  `sailfish-patch -u` in the published directory. This way, you do not have to
  publish potentially copyrighted material without permission.

See [the manpage](MANPAGE.md) for more information.

## Importing an existing patch

Importing a patch for which there is a `CONFIG` file is very straightforward:

- Create an empty directory for the patch, e.g. `my-patch`
- Drop `CONFIG` as well as either `unified_diff.patch` or a tarball containing
  the patch file into this directory.
- Run `sailfish-patch -u`.

If no `CONFIG` file is available, follow these steps:

- Create a new configuration file with `sailfish-patch -eC > CONFIG`.
- Specify source packages, patch name, etc. (see step 1 in "Creating a new patch").
- Run `sailfish-patch -i CONFIG my_patch_file.diff` to create a new repo and bootstrap it.

# Installation

`sailfish-patch` is written purely in `bash` but requires the following shell commands:

    patch git scp ssh sed xclip
    rpm rpmbuild rpm2cpio cpio tar
    hxselect hxnormalize (from package html-xml-utils)
    du numfmt
    html2text (from package python3-html2text)
    pngcrush pngquant convert (from package imagemagick)

## Installation in a virtual machine

On non-Debian based distros, it might be easier to use a virtual machine to run
the sailfish-patch utility. Install [vagrant](https://www.vagrantup.com/) and
choose a provider, for example Virtualbox (and maybe the vbguest plugin with
`vagrant plugin install vagrant-vbguest`).

You can now setup a virtual machine by running `vagrant up` in the `vagrant`
folder. SSH into the virtual machine with `vagrant ssh`, you find the synced
folder under `/vagrant` which is one level above the folder of `sailfish-patch`.
(The synced folder can be changed in `vagrant/Vagrantfile`)

# License

`sailfish-patch 2.6.0 (2023-04-09)`

Copyright (C) 2018-2021  Mirian Margiani

(`sailfish-patch` was originally based on
[`gen-sailfish-patch`](https://github.com/cornerman/gen-sailfish-patch)
by Cornerman (2016).)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
