#!/bin/bash

script_dir=$(dirname "$(readlink -f "$0")")
json_file="$script_dir/patch.json"
gitignore_file="$script_dir/gitignore"
spec_file="$script_dir/patch.spec"

out_dir="build"
patch_dir="$out_dir/patch"
rpm_dir="$out_dir/rpm"

orig_branch="$(git branch --list | grep -E '^\s*original$')"
if [ -z "$orig_branch" ]; then
    echo "Missing 'original' branch."
    echo "Create this branch and commit the original qml files without changes."
    echo "From there, the diff is created"
    exit 1
fi

[ -f dir ] && prefix_dir="$(cat dir | head -n 1)" || prefix_dir="/"

if [ ! -d "$out_dir" ]; then
    mkdir -p "$out_dir"
    cp "$gitignore_file" "$out_dir/.gitignore"
fi

if [ ! -d "$rpm_dir" ]; then
    mkdir -p "$rpm_dir"
    cp "$spec_file" "$rpm_dir/TODO.spec"
fi

if [ ! -d "$patch_dir" ]; then
    mkdir -p "$patch_dir"
    cp "$json_file" "$patch_dir/patch.json"
fi

git diff original --src-prefix="a$prefix_dir" --dst-prefix="b$prefix_dir" **/*.qml > $patch_dir/unified_diff.patch
