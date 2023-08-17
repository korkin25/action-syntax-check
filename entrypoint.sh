#!/bin/bash

env

find . -name yamllint.yaml

# Check for yamllint config
if [ -f ".yamllint" ]; then
    echo "Using detected .yamllint config path."
    YAMLLINT_CONFIG_PATH=".yamllint"
else
    echo "Using default yamllint config path: /github/workspace/.github/yamllint.yaml"
    YAMLLINT_CONFIG_PATH=".github/yamllint.yaml"
fi

ls -l
# Check YAML Syntax for All Files
find . -name "*.yml" -o -name "*.yaml" | while read -r file; do
    yamllint -c "$YAMLLINT_CONFIG_PATH" "$file"
done

# Check GitHub Actions Workflow Syntax
actionlint
