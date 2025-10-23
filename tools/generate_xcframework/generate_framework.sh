#!/bin/sh

ROOT_DIR=$PWD
TOOL_DIR=$ROOT_DIR/tools/generate_xcframework

cd $TOOL_DIR

# Step 1: Creating static library
./build_static_lib.sh

# Step 2: Build xcframework
./build_xcframework.sh

# Step 3: compress framework and calculate checksums
./build_compress_framework.sh
