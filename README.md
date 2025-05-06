# Boilerplate Cross-Platform C Project Layout (Cosmopolitan)

## Overview

This is a basic layout and boilerplate project template for building cross-platform applications in C using the Cosmopolitan toolchain.  The package provides everything you'll need to get started quickly, including:

- a Makefile that allows you to toggle the compiler toolchain between cosmopolitan, GCC and clang
- optimized editor configurations for a better development experience using VSCode, Vim, NeoVim (and others)
- customizable documentation, packaging and license templates based on current open-source conventions to simplify distribution

If you are creating a simple application or learning Cosmopolitan, this project layout provides a general structure for organizing your applications, focusing on the layout rather than specific implementation details. This template is high-level and doesn't delve into architectural patterns like layered architectures or specific design paradigms.

This is **`NOT an official standard defined by the developers of Cosmopolitan or C standards groups`**. This is a suggested organizational structure to help maintain clean code separation and organization. While the Cosmopolitan library itself doesn't mandate any specific project layout, this structure builds on common C project conventions and adds Cosmopolitan-specific considerations.

> [!NOTE]
>
> This template is just a starting point to get going. Feel free to adapt it to your specific needs. The most important aspect is maintaining a clean separation of concerns and logical organization of your codebase.

## Building with Cosmopolitan LibC

Cosmopolitan allows you to create single-file executables that run on multiple platforms, including Linux, macOS, Windows, FreeBSD, OpenBSD, and NetBSD. To build with Cosmopolitan:

1. Install the Cosmopolitan library (instructions at [https://github.com/jart/cosmopolitan](https://github.com/jart/cosmopolitan))
2. Configure your build system to link against Cosmopolitan
3. Use the provided build scripts to generate portable executables

Refer to the [Cosmopolitan documentation](https://justine.lol/cosmopolitan/documentation.html) for detailed build instructions and options.

## Build Configuration

The project includes a versatile Makefile that supports multiple compiler toolchains:

- **Cosmopolitan (default)**: Uses `cosmocc` to build APE (Actually Portable Executable) binaries
- **GCC**: Standard GNU C Compiler
- **Clang**: LLVM C Compiler

### Using the Makefile

The Makefile supports the following commands:

```bash
# Build with default toolchain (auto-detected, defaults to Cosmopolitan)
make

# Build with a specific toolchain
make TOOLCHAIN=gcc
make TOOLCHAIN=clang
make TOOLCHAIN=cosmo

# Clean build artifacts
make clean

# Rebuild from scratch
make rebuild

# Run the application
make run

# Debug the application
make debug

# Install to $PREFIX/bin (defaults to ~/.local/bin)
make install
make PREFIX=/usr/local install

# Get build information
make info
```

### Toggling Between Toolchains

You can easily toggle between toolchains by setting the `TOOLCHAIN` environment variable:

```bash
# Set temporarily for a single command
TOOLCHAIN=gcc make

# Set for the current shell session
export TOOLCHAIN=clang
make

# Or pass directly to the make command
make TOOLCHAIN=cosmo
```

This allows you to quickly test your code with different compilers without changing any configuration files.

## Editor Configuration

This project includes optimized configurations for multiple editors to provide a seamless development experience:

### Visual Studio Code

The `.vscode` directory contains:

- **tasks.json**: Build tasks for different toolchains
- **launch.json**: Debug configurations
- **c_cpp_properties.json**: IntelliSense configurations for all supported platforms and toolchains
- **settings.json**: Editor settings optimized for C development with Cosmopolitan

VS Code tasks include:

- `build`: Default build (uses the auto-detected toolchain)
- `build-cosmo`: Build specifically with Cosmopolitan
- `build-clang`: Build with Clang
- `run`: Run the application
- `clean`: Clean build artifacts

### Vim/Neovim

The project includes configurations for both Vim and Neovim:

- **`.vim/coc-settings.json`**: Configuration for Conquer of Completion (CoC) extension, with C language server settings
- **`.config/nvim`**: Neovim-specific configurations

These configurations provide:

- Language server integration via clangd
- C23 standard support
- Project-aware navigation and code intelligence

To get the most from these configurations, ensure you have:

- For Vim: CoC extension and clangd language server installed
- For Neovim: Language server support configured

## Directories

### `/src`

Main source code for your application.

This directory contains all your C source code (`.c` files). For larger projects, you might organize this directory further into subdirectories based on functionality or modules.

### `/include`

Header files for your project.

Public header files that define your project's API live here. The directory structure should mirror that of `/src` to make it easy to find corresponding headers and source files.

### `/lib`

Internal libraries that are specific to your project.

If your project has code that can be logically separated into libraries, place that code here. This helps maintain separation of concerns and makes your codebase more modular.

### `/third_party`

External dependencies and libraries.

This directory contains external code that your project depends on. If you're using git submodules to manage dependencies, they would typically be placed here.

## Build and Distribution Directories

### `/build`

Build artifacts and configurations.

Contains scripts and configuration files needed for building your project. This might include specialized build steps for Cosmopolitan's APE (Actually Portable Executable) format.

### `/bin`

Binary executables output directory.

The compiled binaries from your project go here. Your build system should output executables to this directory.

## Additional Directories

### `/test`

Test code and test data.

Contains unit tests, integration tests, and test data for your application. For larger projects, consider subdividing this directory to organize different types of tests.

### `/docs`

Documentation for your project.

Project documentation, including API documentation, usage guides, and other helpful resources.

### `/scripts`

Utility scripts for development, building, and deployment.

Various scripts that aid in development, building, packaging, or deploying your application.

### `/examples`

Example code demonstrating how to use your project.

Simple examples that show how to use your code, API, or library. These examples should be easy to understand and well-documented.

### `/tools`

Tools and utilities specific to your project.

Development tools that help with building, testing, or other aspects of your project.

## License

**This package is released to the public domain.** For the purpose of compliance in and for international jurisdictions which do not recognize the public domain as a license under law, this package is thereby distributed under the most permissive terms and conditions available under the laws of said jurisdiction.

The software is provided "as is" and the author disclaims all warranties with regard to this software including all implied warranties of merchantability and fitness. In no event shall the author be liable for any special, direct, indirect, or consequential damages or any damages whatsoever resulting from loss of use, data or profits, whether in an action of contract, negligence or other tortious action, arising out of or in connection with the use or performance of this software.

Third-party software and libraries containing all or part of the contents of this package are governed by the provisions of their respective licenses.
# cosmo-project
