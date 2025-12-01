#!/bin/bash

temp=$(curl wttr.in/$WTTR_LOCATION\\?format='%t')
echo "$temp" | sed 's/+//' | sed 's/F//'
