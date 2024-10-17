#! /bin/bash

echo "Start Danger!!!"

export DANGER_GITHUB_API_TOKEN="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"

DERIVED_DATA_PATH=$(echo "$BUILT_PRODUCTS_DIR" | sed -E 's|(.*)/Build/Products.*|\1|')
INDEX_STORE_PATH=$DERIVED_DATA_PATH/Index.noindex/DataStore
export INDEX_STORE_PATH

cd ./DangerSwiftPeriphery
swift run danger-swift ci