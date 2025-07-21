#!/bin/bash

# img2webp Installation Script
# This script installs img2webp globally on your system

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

# Check if img2webp.sh exists
if [[ ! -f "img2webp.sh" ]]; then
    print_error "img2webp.sh not found in current directory!"
    print_error "Please run this installer from the img2webp directory."
    exit 1
fi

# Check if cwebp is available
if ! command -v cwebp &> /dev/null; then
    print_error "cwebp command not found!"
    echo
    print_status "Please install WebP tools first:"
    echo
    echo "macOS:"
    echo "  brew install webp"
    echo
    echo "Ubuntu/Debian:"
    echo "  sudo apt update && sudo apt install webp"
    echo
    echo "CentOS/RHEL:"
    echo "  sudo yum install libwebp-tools"
    echo
    echo "Fedora:"
    echo "  sudo dnf install libwebp-tools"
    echo
    exit 1
fi

print_success "cwebp found ✓"

# Determine installation method
print_status "Choose installation method:"
echo "1) System-wide installation (requires sudo)"
echo "2) User-only installation (recommended)"
echo "3) Cancel"
echo
read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            print_status "Installing system-wide..."
            sudo cp img2webp.sh /usr/local/bin/img2webp
            sudo chmod +x /usr/local/bin/img2webp
            print_success "img2webp installed to /usr/local/bin/img2webp"
            ;;
        2)
            print_status "Installing for current user..."
            mkdir -p ~/.local/bin
            cp img2webp.sh ~/.local/bin/img2webp
            chmod +x ~/.local/bin/img2webp
        
        # Check if ~/.local/bin is in PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            print_warning "~/.local/bin is not in your PATH"
            print_status "Adding to PATH..."
            
            # Detect shell
            if [[ "$SHELL" == *"zsh"* ]]; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
                print_success "Added to ~/.zshrc"
                print_status "Run 'source ~/.zshrc' or restart your terminal"
            elif [[ "$SHELL" == *"bash"* ]]; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
                print_success "Added to ~/.bashrc"
                print_status "Run 'source ~/.bashrc' or restart your terminal"
            else
                print_warning "Unknown shell. Please manually add ~/.local/bin to your PATH"
            fi
        fi
        
        print_success "img2webp installed to ~/.local/bin/img2webp"
        ;;
    3)
        print_status "Installation cancelled"
        exit 0
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

echo
print_success "Installation completed!"
echo
print_status "Usage examples:"
echo "  img2webp image.jpg"
echo "  img2webp /path/to/images/"
echo "  img2webp image1.jpg image2.png"
echo
print_status "For more information, see the README.md file" 