# exit when any command fails
set -eo pipefail

# Usage function
usage()
{
    echo "usage: setup.sh [-p/--pod ]"
}

# Checks to see if an environment variable is set.
isset() {
    set +o nounset
    [[ -n "${!1+x}" ]]
    result=$?
    set -o nounset
    return $result
}

##### Main
useCocoapods=false

while [ "$1" != "" ]; do
    case $1 in
        -p | --pod )            useCocoapods=true
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Checking to see if homebrew is installed
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Update brew
brew update

# Checking to see if fastlane is installed
command -v fastlane >/dev/null 2>&1 || { echo >&2 "Installing Fastlane now"; \
brew install fastlane; }

# Checking to see if ios-deploy is installed
command -v ios-deploy >/dev/null 2>&1 || { echo >&2 "Installing ios-deploy now"; \
brew install ios-deploy; }

# Checking to see if swiftlint is installed
command -v swiftlint >/dev/null 2>&1 || { echo >&2 "Installing swiftlint now"; \
brew install swiftlint; }

# Checking to see if swiftgen is installed
command -v swiftgen >/dev/null 2>&1 || { echo >&2 "Installing swiftgen now"; \
brew install swiftgen; }

# Checking to see if swiftformat is installed
command -v swiftformat >/dev/null 2>&1 || { echo >&2 "Installing swiftformat now"; \
brew install swiftformat; }

# Install fastlane
command -v fastlane >/dev/null 2>&1 || { echo >&2 "Installing fastlane gem now"; \
sudo gem install fastlane; }

# Checking to see if xcpretty is installed
command -v xcpretty >/dev/null 2>&1 || { echo >&2 "Installing xcpretty now"; \
sudo gem install xcpretty; }

# Install xcode-install
command -v xcversion >/dev/null 2>&1 || { echo >&2 "Installing xcode-install gem now"; \
sudo gem install xcode-install; }

if $useCocoapods; then

    # Checking to see if cocoapods is installed
    command -v pod >/dev/null 2>&1 || { echo >&2 "Installing Cocoapods now"; \
    sudo gem install cocoapods; }

    rm -rf Pods
    pod install
    pod update
fi

echo "Finished"
