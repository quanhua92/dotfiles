#!/bin/bash
output_file="combined.txt"

if [ -f "$output_file" ]; then
    rm "$output_file"
fi

if [ $# -eq 0 ]; then
    echo "Please provide at least one file pattern as an argument."
    exit 1
fi

for pattern in "$@"; do
    find . -type f -name "$pattern" | while IFS= read -r file; do
        full_path=$(realpath "$file")
        echo "// $full_path" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
    done
done

echo "All files matching patterns $* have been combined into $output_file"

