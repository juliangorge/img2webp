# Contributing to img2webp

Thank you for your interest in contributing to img2webp! This document provides guidelines and information for contributors.

## How to Contribute

### Reporting Issues

Before creating a new issue, please:

1. **Search existing issues** to see if your problem has already been reported
2. **Check the README** for troubleshooting information
3. **Provide detailed information** including:
   - Your operating system and version
   - The exact command you ran
   - Any error messages
   - Steps to reproduce the issue

### Suggesting Features

We welcome feature suggestions! When suggesting a feature:

1. **Describe the problem** you're trying to solve
2. **Explain your proposed solution**
3. **Consider the impact** on existing functionality
4. **Provide examples** of how it would work

### Submitting Code Changes

#### Prerequisites

- Basic knowledge of bash scripting
- Understanding of the WebP format
- Git experience

#### Development Setup

1. **Fork the repository**
2. **Clone your fork:**

   ```bash
   git clone https://github.com/yourusername/img2webp.git
   cd img2webp
   ```

3. **Create a feature branch:**

   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make your changes**
5. **Test your changes thoroughly**
6. **Commit your changes:**

   ```bash
   git commit -m "Add: brief description of your change"
   ```

7. **Push to your fork:**

   ```bash
   git push origin feature/your-feature-name
   ```

8. **Create a Pull Request**

#### Code Style Guidelines

- **Use consistent indentation** (4 spaces)
- **Add comments** for complex logic
- **Follow bash best practices**
- **Test on multiple platforms** if possible
- **Update documentation** for new features

#### Testing

Before submitting a PR, please test:

- **Different file types** (JPG, PNG, JPEG)
- **Single files and directories**
- **Files with spaces in names**
- **Nested directory structures**
- **Error conditions** (invalid files, permissions, etc.)

### Areas for Contribution

#### High Priority

- **Performance improvements**
- **Better error handling**
- **Additional format support**
- **Cross-platform compatibility**

#### Medium Priority

- **Configuration options** (quality settings, output format)
- **Progress indicators** for large batches
- **Dry-run mode**
- **Batch processing optimizations**

#### Low Priority

- **GUI wrapper**
- **Integration with other tools**
- **Additional output formats**

## Development Environment

### Required Tools

- `cwebp` (WebP encoder)
- `bash` shell
- `git`

### Testing

```bash
# Test with sample images
./img2webp.sh test_image.jpg
./img2webp.sh test_directory/

# Test error conditions
./img2webp.sh nonexistent_file
./img2webp.sh unsupported_file.txt
```

## Pull Request Guidelines

### Before Submitting

1. **Ensure your code works** on your system
2. **Update documentation** if needed
3. **Add tests** for new functionality
4. **Follow the existing code style**
5. **Write clear commit messages**

### PR Description

Include:

- **Summary** of changes
- **Motivation** for the change
- **Testing** performed
- **Breaking changes** (if any)
- **Screenshots** (if UI changes)

### Review Process

1. **Automated checks** must pass
2. **Code review** by maintainers
3. **Testing** on different platforms
4. **Documentation** review

## Code of Conduct

- **Be respectful** and inclusive
- **Help others** learn and contribute
- **Focus on the code** and technical discussions
- **Report inappropriate behavior** to maintainers

## Getting Help

- **GitHub Issues** for bugs and feature requests
- **GitHub Discussions** for questions and ideas
- **README.md** for usage information

## License

By contributing to img2webp, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to img2webp! 🚀
