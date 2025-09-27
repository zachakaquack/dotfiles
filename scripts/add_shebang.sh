#!/bin/bash

DIR="$1"

if [[ -z "$DIR" ]]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

for file in "$DIR"/*.sh; do
    # Skip if not a regular file
    [[ -f "$file" ]] || continue

    # Read first line
    first_line=$(head -n 1 "$file")

    if [[ "$first_line" != "#!/bin/bash"* ]]; then
        echo "Adding shebang to $file"
        # Prepend shebang
        sed -i '1i #!/bin/bash' "$file"
    else
        echo "Shebang already present in $file"
    fi
done
