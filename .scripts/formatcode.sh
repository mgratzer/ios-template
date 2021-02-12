if which swiftlint >/dev/null; then
  swiftlint autocorrect
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

if which swiftformat >/dev/null; then
  swiftformat .
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
fi
