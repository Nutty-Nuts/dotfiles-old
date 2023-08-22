#!/bin/sh

function verify_dir() {
    if [ ! -d "./lib/$1" ]; then
        echo "Current directory is not the root directory of a project"
        exit 1
    fi
}

function build_project() {
    cd ./lib/$1/
    cmake -DCMAKE_BUILD_TYPE=${1^} ../..
    cmake --build .
    cd ../..
}

if [[ "$1" == "--release" || "$1" == "-r" || "$1" == "release" ]]; then
    verify_dir "release"
    build_project "release"
elif [[ "$1" == "--debug" || "$1" == "-d" || "$1" == "debug" ]]; then
    verify_dir "debug"
    build_project "debug"
else
    echo "Invalid parameters"
fi
