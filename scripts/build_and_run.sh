#!/bin/bash

CWD=$(pwd)
CPP_FILES=$(find "$CWD" -maxdepth 1 -name "*.cpp")

# no files found
if [ -z "$CPP_FILES" ]; then
    echo "no files"
    exit 1
fi

# compile
g++ -Wall -Wextra -std=c++17 $CPP_FILES

# run if good
if [ $? -eq 0 ]; then
    ./a.out
else
    exit 1
fi
