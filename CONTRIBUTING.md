# Contributing to Cosmo Project

Thank you for considering contributing to this Cosmopolitan C project! This document outlines the process for contributing to the project and how to get started as a contributor.

## Code of Conduct

Please read and follow our [Code of Conduct](project/CODE_OF_CONDUCT.md) to keep our community respectful and inclusive.

## Getting Started

### Prerequisites

- Cosmopolitan C toolchain (cosmocc)
- GCC or Clang (as alternative toolchains)
- Make
- Git

### Setting Up the Development Environment

1. Clone the repository

   ```sh
   git clone https://github.com/your-username/cosmo-project.git
   cd cosmo-project
   ```

2. Explore the project structure to understand the organization
   - `src/`: Source code files
   - `include/`: Header files
   - `test/`: Test files
   - `docs/`: Documentation
   - `examples/`: Example code

3. Build the project

   ```sh
   make
   ```

4. Run the project

   ```sh
   make run
   ```

## Development Workflow

1. Create a new branch for your feature or fix

   ```sh
   git checkout -b feature/your-feature-name
   ```

2. Make your changes, adhering to the coding standards

3. Build and test your changes

   ```sh
   make rebuild
   make test
   ```

4. Commit your changes with a descriptive message

   ```sh
   git commit -m "Add feature: description of the feature"
   ```

5. Push your branch to your fork

   ```sh
   git push origin feature/your-feature-name
   ```

6. Create a pull request against the main repository

## Pull Request Process

1. Ensure your code builds without errors and passes all tests
2. Update documentation if necessary
3. Include a clear description of the changes in your pull request
4. Link any related issues in your pull request description
5. Wait for review and address any feedback

## Coding Standards

### C Code Style

- Follow the C23 standard as specified in the Makefile
- Use 4 spaces for indentation (not tabs)
- Keep lines under 100 characters when possible
- Use descriptive variable and function names
- Add comments for non-obvious code sections
- Include proper header documentation for all files

### Documentation

- Document all public functions, types, and constants
- Keep documentation up-to-date with code changes
- Use Doxygen-style comments for API documentation

## Testing Guidelines

- Write tests for all new features and bug fixes
- Ensure all tests pass before submitting a pull request
- Cover edge cases and error conditions in your tests

## Reporting Issues

- Use the GitHub issue tracker to report bugs or suggest features
- Provide clear steps to reproduce bugs
- Include relevant information like OS, compiler version, etc.
- Use labels appropriately to categorize issues

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project (Public Domain or the most permissive terms available).

## Questions and Support

If you have questions or need support, please refer to the [SUPPORT.md](SUPPORT.md) file or visit the official [documentation](https://dun.dev/cosmo-project) for additional resources.
