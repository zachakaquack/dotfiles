#!/usr/bin/env bash

app_id=$1
foot --app-id "$app_id" sh -c "cat ~/.cache/wal/sequences && kalker"
