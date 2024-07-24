#!/bin/bash

if [[ $# -gt 1 ]]; then
    echo "Needs 0 or 1 argument: mc version"
    exit 1

elif [[ $# -eq 0 ]]; then
    if [[ -f "version.txt" ]]; then
        vfile="version.txt"
    elif [[ -f "../version.txt" ]]; then
        vfile="../version.txt"
    fi
    v="v$(cat $vfile)"

elif [[ $# -eq 1 ]]; then
    v="v$1"
fi

if [[ ! $v =~ ^v1\.[0-9]{2}$ ]]; then
    if [[ -n $vfile ]]; then
        echo "$vfile has incorrect format"
    fi
    echo "Needs version format #.##"
    exit 1
fi

echo "Tagging with $v"

git tag -f -a "$v" -m "$1 finished"
git push origin --delete "$v"
git push origin "$v"