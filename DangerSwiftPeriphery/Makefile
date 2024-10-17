SWIFT = $(shell which swift)
DEV_TOOLS_BUILD_FLAGS = --configuration release --package-path ./DevTools
XCBEAUTIFY_EXECUTABLE = ./DevTools/.build/release/xcbeautify
SHELL=/bin/bash

.PHONY: dev
dev:
	$(SWIFT) build $(DEV_TOOLS_BUILD_FLAGS) --product xcbeautify

.PHONY: test
test:
	set -eo pipefail && $(SWIFT) test 2>&1 | $(XCBEAUTIFY_EXECUTABLE)
