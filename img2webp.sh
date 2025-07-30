#!/bin/bash

# Converts images to .webp, preserving location
# Usage: img2webp [-r] file1 dir1 file2 ...
#   -r: Remove original files after successful conversion

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Default settings
REMOVE_ORIGINAL=false

# Function to show usage
show_usage() {
    echo "Usage: img2webp [-r] file1 dir1 file2 ..."
    echo "  -r: Remove original files after successful conversion"
    echo ""
    echo "Examples:"
    echo "  img2webp image.jpg                    # Convert and keep original"
    echo "  img2webp -r image.jpg                 # Convert and remove original"
    echo "  img2webp -r /path/to/images/          # Convert directory and remove originals"
    echo "  img2webp image1.jpg image2.png        # Convert multiple files"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--remove)
            REMOVE_ORIGINAL=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        -*)
            echo "❌ Unknown option: $1"
            show_usage
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

# Check if any files/directories were provided
if [[ $# -eq 0 ]]; then
    echo "❌ No files or directories specified"
    show_usage
    exit 1
fi

# Function to convert a single image
convert_image() {
    local input="$1"
    local output="${input%.*}.webp"
    
    # Validate input file exists and is readable
    if [[ ! -f "$input" ]]; then
        echo "❌ File not found: $input"
        return 1
    fi
    
    if [[ ! -r "$input" ]]; then
        echo "❌ File not readable: $input"
        return 1
    fi

    echo "Converting: $input"
    
    # Use cwebp with proper quoting and error handling
    if cwebp -quiet -q 80 "$input" -o "$output"; then
        echo "✅ Saved: $output"
        
        # Remove original file if requested
        if [[ "$REMOVE_ORIGINAL" == true ]]; then
            if rm "$input"; then
                echo "🗑️  Removed original: $input"
            else
                echo "⚠️  Warning: Could not remove original file: $input"
            fi
        fi
    else
        echo "❌ Failed to convert: $input"
        return 1
    fi
}

# Function to check if file is a supported image
is_supported_image() {
    local file="$1"
    local ext="${file##*.}"
    local ext_lower
    
    # Handle case where file has no extension
    if [[ "$ext" == "$file" ]]; then
        return 1
    fi
    
    ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
    [[ "$ext_lower" =~ ^(jpg|jpeg|png)$ ]]
}

# Main processing loop
for target in "$@"; do
    # Debug: show what we're processing
    echo "Processing: '$target'"
    
    if [[ -f "$target" ]]; then
        if is_supported_image "$target"; then
            convert_image "$target"
        else
            echo "❌ Skipping unsupported file: $target"
        fi
    elif [[ -d "$target" ]]; then
        echo "Processing directory: $target"
        # Use find with proper handling of filenames with spaces
        while IFS= read -r -d '' file; do
            if is_supported_image "$file"; then
                convert_image "$file"
            else
                echo "❌ Skipping unsupported file: $file"
            fi
        done < <(find "$target" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0)
    else
        echo "❌ Not a valid file or directory: $target"
    fi
done