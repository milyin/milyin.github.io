#!/bin/bash

# Change to the directory where the script is located
pushd "$(dirname "$0")" > /dev/null

# Navigate to the submodule directory
pushd ../submodules/zenoh-tetris > /dev/null

# Install dependencies and build the project
yarn install
yarn build

# Copy necessary files to the root zenoh-tetris directory
cp -r dist/* ../../zenoh-tetris/

# Navigate back to the script directory
popd > /dev/null

# Navigate back to the original directory
popd > /dev/null