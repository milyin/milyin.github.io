#!/bin/bash

# Save the current script directory to an absolute path
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Change to the script directory
pushd "$script_dir" > /dev/null

# Create a temporary directory and clone the repository
temp_dir=$(mktemp -d)
git clone https://github.com/milyin/zenoh-tetris "$temp_dir"

# Navigate to the cloned repository directory
pushd "$temp_dir" > /dev/null

# Install dependencies and build the project
yarn install
yarn build

# Copy necessary files to the root zenoh-tetris directory
cp -r dist/* "$script_dir/../zenoh-tetris/"

# Navigate back to the script directory
popd > /dev/null

# Remove the temporary directory
rm -rf "$temp_dir"

# Navigate back to the original directory
popd > /dev/null