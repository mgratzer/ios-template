if which swiftgen >/dev/null; then
  arch -x86_64 swiftgen
else
  echo "warning: SwiftGen not installed, run `brew update & brew install swiftgen`"
fi
