
# sailfish-patch

`sailfish-patch` is a helper tool for developing SailfishOS patches.

Create a new patch skeleton with `-c NAME` and put the original files
in the directory `original`. Copy everything to the directory `patched` and
make your changes. Configure the project in `build/CONFIG`. Build with `-b`.

You can add all packages a patch is based on in the `SourcePackages` field
in the configuration file. Running `sailfish-patch -u` will update all source
files and makes it easy to adapt the patch to new upstream versions.

Note that it must be possible for `sailfish-patch` to connect to your device via
SSH if you want to use source packages from the official repos. Make sure this
is configured correctly. (This is not needed for OpenRepos sources.)

If you want to add your own settings pages or include translation files,
icons etc. in your patch, you can place them in the `extra` directory. Note
that this is not yet supported for RPMs.

Tips:

- Set the enviroment variables from the manpage to configure the ssh connection to your device.
- Use `rpm -qf /path/to/file` to find out which package a file belongs to.
- Use `pkcon get-details packagename` to check which version is installed.
- Use `sailfish-patch -b -p` to test the patch directly after building (needs ssh).
- Do not push your patch to a public repository. Instead, publish the `code
  distribution package` which includes only the files that belong to you.
  Other users can rebuild the development environment by running
  `sailfish-patch -u` in the published directory. This way, you do not have to
  publish potentially copyrighted material without permission.


See `MANPAGE.md` for more information.

# Installation

`sailfish-patch` is written purely in `bash` but has the following dependencies:

    patch git scp ssh sshpass sed xclip
    rpm rpmbuild rpm2cpio cpio tar
    hxselect hxnormalize (from package html-xml-utils)
    du numfmt
    html2text (from package python3-html2text)
    pngcrush pngquant convert (from package imagemagick)

## Installation in a virtual machine

On non-debian based distros, its easier to use a virtual machine to run the sailfish-patch utility.
Install [vagrant](https://www.vagrantup.com/) and choose a provider, for example virtualbox (and maybe the vbguest plugin with `vagrant plugin install vagrant-vbguest`).

You can now setup a virtual machine by running `vagrant up` in the `vagrant` folder.
SSH into the virtual machine with `vagrant ssh`, you find the synced folder under `/vagrant` which is one level above the folder of `sailfish-patch`.
(The synced folder can be changed in `vagrant/Vagrantfile`)

# License

`sailfish-patch 2.0.0 (2019-07-05)`

Copyright (C) 2018-2019  Mirian Margiani

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
