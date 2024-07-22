#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Needs 1 argument: mc version"
    exit 1
elif [[ ! $1 =~ ^1\.[0-9]{1,2}$ ]]; then
    echo "Needs version format #.##"
    exit 1
fi

v="v$1"

echo "Tagging with $v"

git tag -f -a "$v" -m "$1 finished"
git push origin --delete "$v"
git push origin "$v"