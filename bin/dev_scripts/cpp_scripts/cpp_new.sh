#!/bin/sh

if [[ -z "$1" ]]; then
    echo "ERROR: Invalid Parameters"
else
    mkdir $1
    cd $1
    mkdir -p lib/debug lib/release res src include

    cp ~/Templates/main.cpp ./src
    cp ~/Templates/.clang-format .
    cp ~/Templates/CMakeLists.txt .

    echo "" | cat - CMakeLists.txt > temp && mv temp CMakeLists.txt
    echo "project($1 VERSION 1.0.0)" | cat - CMakeLists.txt > temp && mv temp CMakeLists.txt
    echo "cmake_minimum_required(VERSION 3.5)" | cat - CMakeLists.txt > temp && mv temp CMakeLists.txt

    dir=$(pwd)

    touch compile_flags.txt
    echo "-I$dir/include" >> compile_flags.txt
    echo "-I$dir/res" >> compile_flags.txt
fi
