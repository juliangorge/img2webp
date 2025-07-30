# Changelog

All notable changes to img2webp will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Installation script (`install.sh`)
- Uninstallation script (`uninstall.sh`)
- Comprehensive documentation
- Contributing guidelines
- MIT License
- `-r` flag to remove original files after conversion
- Help system with `--help` option
- Better command-line argument parsing

### Changed

- Improved error handling and user feedback
- Enhanced documentation with examples
- Renamed `script.sh` to `img2webp.sh` for better clarity

## [1.0.0] - 2024-01-XX

### Added

- Initial release of img2webp
- Support for JPG, JPEG, and PNG input formats
- WebP output format with 80% quality
- Directory and file processing
- Preserves original file locations
- Verbose feedback with success/error indicators
- Global installation support

### Features

- Convert single images: `img2webp image.jpg`
- Convert multiple images: `img2webp image1.jpg image2.png`
- Convert directories: `img2webp /path/to/images/`
- Process nested directory structures
- Skip unsupported file types with clear feedback
- Error handling for invalid files/directories

---

## Version History

### Version 1.0.0

- **Initial release** with core functionality
- **Cross-platform support** (macOS, Linux, Windows with WSL)
- **Simple and efficient** image conversion
- **Preserves directory structure** when processing folders
- **High-quality output** using Google's WebP encoder

---

## Future Plans

### Planned for v1.1.0

- [ ] Configurable quality settings
- [ ] Progress indicators for large batches
- [ ] Dry-run mode
- [ ] Additional input format support (GIF, BMP)

### Planned for v1.2.0

- [ ] Batch processing optimizations
- [ ] Configuration file support
- [ ] Integration with other image tools
- [ ] Performance improvements

---

## Contributing

To contribute to this changelog, please follow the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format and add your changes under the appropriate section.
