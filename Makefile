
HOMEBREW := $(shell command -v brew 2>/dev/null)

default: setup

setup: \
 check_for_homebrew \
 install_swiftlint \
 setup_swiftformat

# Check if Homebrew is installed, otherwise exists with message
check_for_homebrew:
 $(info Checking for Homebrew ...)

ifeq ($(HOMEBREW),)
 $(error Homebrew is not installed)
endif

install_swiftlint:
 $(info Installing SwiftLint ...)

 $(shell brew install swiftlint)

setup_swiftformat:
 $(info Setup swiftformat ...)

 $(shell cp ./scripts/pre-commit ./.git/hooks)
 $(shell chmod +x ./.git/hooks/pre-commit)
 $(shell chmod +x ./scripts/git-format-staged)