#!/bin/bash
output_file="combined.txt"

if [ -f "$output_file" ]; then
    rm "$output_file"
fi

for file in *; do
    if [ -f "$file" ]; then
        full_path=$(pwd)/"$file"
        echo "// $full_path" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
    fi
done

echo "All files have been combined into $output_file"
