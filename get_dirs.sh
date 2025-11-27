#!/bin/bash

dirs=$(ls -d */)
dirs=$(echo $dirs | sed 's/\///g')
echo $dirs
