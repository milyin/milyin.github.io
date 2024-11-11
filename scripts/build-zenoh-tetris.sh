#!/bin/bash

# Change to the directory where the script is located
pushd "$(dirname "$0")" > /dev/null

# Create a temporary directory and clone the repository
temp_dir=$(mktemp -d)
git clone https://github.com/milyin/zenoh-tetris "$temp_dir"

# Navigate to the cloned repository directory
pushd "$temp_dir" > /dev/null

# Install dependencies and build the project
yarn install
yarn build

# Copy necessary files to the root zenoh-tetris directory
cp -r dist/* ../../zenoh-tetris/

# Navigate back to the script directory
popd > /dev/null

# Remove the temporary directory
rm -rf "$temp_dir"

# Navigate back to the original directory
popd > /dev/null