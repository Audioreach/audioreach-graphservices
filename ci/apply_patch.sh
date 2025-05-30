#!/bin/bash
set -e
# This script synchronizes the repositories and patches defined in config.sh.
CONFIG_SCRIPT_PATH="${CONFIG_SCRIPT:-$(dirname "${BASH_SOURCE[0]}")/config.sh}"
source "$CONFIG_SCRIPT_PATH"

for entry in "${PATCHES[@]}"; do
    IFS='|' read -r name patch <<< "$entry"
    dir="$GITHUB_WORKSPACE/../$name"
    echo "Applying patch to $name..."
    git -C "$dir" apply --check "$patch" && git -C "$dir" apply "$patch" || echo "Patch already applied or failed."
done
