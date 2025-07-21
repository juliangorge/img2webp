#!/bin/bash

# img2webp Uninstallation Script
# This script removes img2webp from your system

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_status "img2webp Uninstaller"
echo

# Check if img2webp is installed
if command -v img2webp &> /dev/null; then
    img2webp_path=$(which img2webp)
    print_status "Found img2webp at: $img2webp_path"
    
    # Determine installation type
    if [[ "$img2webp_path" == "/usr/local/bin/img2webp" ]]; then
        print_status "System-wide installation detected"
        echo
        read -p "Remove system-wide installation? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            sudo rm -f /usr/local/bin/img2webp
            print_success "img2webp removed from /usr/local/bin/"
        else
            print_status "Uninstallation cancelled"
            exit 0
        fi
    elif [[ "$img2webp_path" == "$HOME/.local/bin/img2webp" ]]; then
        print_status "User installation detected"
        echo
        read -p "Remove user installation? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            rm -f ~/.local/bin/img2webp
            print_success "img2webp removed from ~/.local/bin/"
            
            # Check if ~/.local/bin is empty and remove if so
            if [[ -z "$(ls -A ~/.local/bin 2>/dev/null)" ]]; then
                print_status "~/.local/bin is empty, removing directory..."
                rmdir ~/.local/bin
            fi
        else
            print_status "Uninstallation cancelled"
            exit 0
        fi
    else
        print_warning "Unknown installation location: $img2webp_path"
        echo
        read -p "Remove this file? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            rm -f "$img2webp_path"
            print_success "img2webp removed"
        else
            print_status "Uninstallation cancelled"
            exit 0
        fi
    fi
else
    print_warning "img2webp not found in PATH"
    print_status "Checking common installation locations..."
    
    # Check common locations
    locations=("/usr/local/bin/img2webp" "$HOME/.local/bin/img2webp" "/usr/bin/img2webp")
    found=false
    
    for location in "${locations[@]}"; do
        if [[ -f "$location" ]]; then
            print_status "Found img2webp at: $location"
            found=true
            echo
            read -p "Remove this file? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                if [[ "$location" == "/usr/local/bin/img2webp" || "$location" == "/usr/bin/img2webp" ]]; then
                    sudo rm -f "$location"
                else
                    rm -f "$location"
                fi
                print_success "img2webp removed from $location"
            fi
        fi
    done
    
    if [[ "$found" == false ]]; then
        print_status "No img2webp installation found"
        exit 0
    fi
fi

echo
print_success "Uninstallation completed!"
print_status "img2webp has been removed from your system" 