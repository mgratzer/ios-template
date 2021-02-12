# iOS Repository template

This is a template repostiory for iOS projects with the following setup:

- `.gitignore` for Swift and Xcode
- `Gemfile` for [fastlan](https://fastlane.tools) and console building
- setup script to install all dependencies
- [Swiftgen](https://github.com/SwiftGen/SwiftGen) for code generation (e.G. localizable strings)
- [Swiftformat](https://github.com/nicklockwood/SwiftFormat) and [Swiftlint](https://github.com/realm/SwiftLint) rules
- scripts for code generation and code formatting

## Steps

1. create a Xcode project in the folder `{APP_NAME}`
2. run `./.scripts/setup.sh`
3. edit `swiftgen.yml` for localization and media assets
4. add excluded paths to `.swiftformat` and `.swiftlint.yml`
5. run `./.scripts/formatcode.sh` and `./.scripts/generatecode.sh`
6. update `README.md` to match your project

--- happy coding <3
