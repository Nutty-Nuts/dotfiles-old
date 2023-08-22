#!/bin/sh

function verify_dir() {
    if [ ! -d "./lib/$1" ]; then
        echo "Current directory is not the root directory of a project"
        exit 1
    fi
}

if [[ "$1" == "--release" || "$1" == "-r" || "$1" == "release" ]]; then
    verify_dir "release"
    ./lib/release/main
elif [[ "$1" == "--debug" || "$1" == "-d" || "$1" == "debug" ]]; then
    verify_dir "release"
    ./lib/debug/maind
else
    echo "Invalid parameters"
fi
