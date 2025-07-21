#!/bin/bash

# Converts images to .webp, preserving location
# Usage: img2webp file1 dir1 file2 ...

convert_image() {
    input="$1"
    output="${input%.*}.webp"

    echo "Converting: $input"
    cwebp -quiet -q 80 "$input" -o "$output" && echo "✅ Saved: $output"
}

for target in "$@"; do
    if [[ -f "$target" ]]; then
        ext="${target##*.}"
        ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
        if [[ "$ext_lower" =~ ^(jpg|jpeg|png)$ ]]; then
            convert_image "$target"
        else
            echo "❌ Skipping unsupported file: $target"
        fi
    elif [[ -d "$target" ]]; then
        find "$target" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
            convert_image "$file"
        done
    else
        echo "❌ Not a valid file or directory: $target"
    fi
done