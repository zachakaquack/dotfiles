#!/bin/bash

./refresh_packages.sh
git add .
git commit -m "update"
git push
