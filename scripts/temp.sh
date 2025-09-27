#!/bin/bash
# Usage: ./absolutify.sh /path/to/dir

DIR="$1"

if [[ -z "$DIR" || ! -d "$DIR" ]]; then
    echo "Usage: $0 /path/to/dir"
    exit 1
fi

# Resolve full paths once
WAL=$(command -v wal)
WAYPAPER=$(command -v waypaper)
PYTHON3=$(command -v python3)
PYWAL_DISCORD=$(command -v pywal-discord)

for file in "$DIR"/*.sh; do
    [[ -f "$file" ]] || continue

    echo "Processing $file"

    # Replace lines in-place
    sed -i \
        -e "s|^wal |$WAL |" \
        -e "s|^waypaper |$WAYPAPER |" \
        -e "s|^python |$PYTHON3 |" \
        -e "s|^pywal-discord |$PYWAL_DISCORD |" \
        "$file"

    # Expand ~ in python script path if present
    sed -i "s|~/|$HOME/|g" "$file"
done
