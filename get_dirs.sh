#!/bin/bash

# list dirs (dir1/ dir2/ dir3)
dirs=$(ls -d */)

# remove '/' from end of dirs
dirs=$(echo $dirs | sed 's/\///g')

# "return" dirs
echo $dirs
