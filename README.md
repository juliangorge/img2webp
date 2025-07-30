# img2webp

A simple and efficient bash script to convert images (JPG, JPEG, PNG) to WebP format while preserving their original location and structure.

## Features

- 🚀 **Fast conversion** using Google's WebP encoder
- 📁 **Preserves directory structure** when processing folders
- 🎯 **Supports multiple formats**: JPG, JPEG, PNG
- 🔧 **Global installation** for easy access from anywhere
- 💾 **High quality output** with 80% quality setting
- 📝 **Verbose feedback** with success/error indicators
- 🗑️ **Optional cleanup** - remove original files with `-r` flag

## Prerequisites

Before installing `img2webp`, make sure you have the following installed:

### macOS

```bash
# Using Homebrew
brew install webp

# Or using MacPorts
sudo port install webp
```

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install webp
```

### CentOS/RHEL/Fedora

```bash
# CentOS/RHEL
sudo yum install libwebp-tools

# Fedora
sudo dnf install libwebp-tools
```

### Windows

Download the WebP tools from [Google's official WebP page](https://developers.google.com/speed/webp/download) and add them to your PATH.

## Installation

### Method 1: Global Installation (Recommended)

1. **Clone this repository:**

   ```bash
   git clone https://github.com/yourusername/img2webp.git
   cd img2webp
   ```

2. **Make the script executable:**

   ```bash
   chmod +x img2webp.sh
   ```

3. **Install globally:**

   ```bash
   # Copy to a directory in your PATH
   sudo cp img2webp.sh /usr/local/bin/img2webp

   # Or install to your user's bin directory (no sudo required)
   mkdir -p ~/.local/bin
   cp img2webp.sh ~/.local/bin/img2webp

   # Add to PATH if not already added (add this to your ~/.bashrc, ~/.zshrc, etc.)
   echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```

### Method 2: Manual Installation

1. Download the `img2webp.sh` file
2. Make it executable: `chmod +x img2webp.sh`
3. Move it to a directory in your PATH or run it directly: `./img2webp.sh`

## Usage

### Basic Usage

```bash
# Convert a single image (keep original)
img2webp image.jpg

# Convert and remove original file
img2webp -r image.jpg

# Convert multiple images
img2webp image1.jpg image2.png photo.jpeg

# Convert all images in a directory and remove originals
img2webp -r /path/to/images/

# Convert images in multiple directories
img2webp /path/to/photos/ /path/to/screenshots/

# Show help
img2webp --help
```

### Examples

```bash
# Convert a single photo (keep original)
img2webp vacation_photo.jpg
# Output: vacation_photo.webp

# Convert and replace original with WebP version
img2webp -r vacation_photo.jpg
# Output: vacation_photo.webp (original .jpg removed)

# Convert all images in current directory
img2webp .

# Convert all images and remove originals
img2webp -r .

# Convert specific images with different formats
img2webp logo.png banner.jpg icon.jpeg

# Process a nested directory structure and remove originals
img2webp -r ~/Pictures/2023/
```

## How It Works

The script:

1. **Accepts multiple arguments** - files and/or directories
2. **Supports options** - `-r` flag to remove original files after conversion
3. **Validates file types** - only processes JPG, JPEG, and PNG files
4. **Preserves structure** - maintains original file locations
5. **Uses cwebp** - Google's WebP encoder with 80% quality
6. **Provides feedback** - shows conversion progress and results
7. **Safe removal** - only removes originals after successful conversion

## Output

- ✅ **Success**: Shows the converted file path
- ❌ **Skipped**: Unsupported file types
- ❌ **Error**: Invalid files or directories

## Quality Settings

The script uses a quality setting of 80% by default, which provides a good balance between file size and image quality. To modify this, edit the script and change the `-q 80` parameter in the `cwebp` command.

## Supported Formats

### Input Formats

- JPG/JPEG
- PNG

### Output Format

- WebP

## Troubleshooting

### "Command not found" error

Make sure the script is in your PATH and is executable:

```bash
which img2webp
chmod +x $(which img2webp)
```

### "cwebp: command not found" error

Install the WebP tools as described in the Prerequisites section.

### Permission denied error

Make sure the script is executable:

```bash
chmod +x img2webp.sh
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Google WebP](https://developers.google.com/speed/webp) - The WebP format and tools
- The open source community for inspiration and feedback

---

**Made with ❤️ for efficient image conversion**
