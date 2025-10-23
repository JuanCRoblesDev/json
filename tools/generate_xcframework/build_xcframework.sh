#!/bin/sh


mkdir -p $PWD/xcframework

rm -rf $PWD/xcframework/*

FRAMEWORK_DEST=$PWD/xcframework
SOURCE_LIBRARY="./tmp"
INCLUDE_DIR="../../single_include"
LIB_NAME="json"

# Create XCFramework
xcodebuild -create-xcframework \
  -library $SOURCE_LIBRARY/lib${LIB_NAME}_macos.a -headers $INCLUDE_DIR \
  -library $SOURCE_LIBRARY/lib${LIB_NAME}_ios.a -headers $INCLUDE_DIR \
  -library $SOURCE_LIBRARY/lib${LIB_NAME}_iossim.a -headers $INCLUDE_DIR \
  -library $SOURCE_LIBRARY/lib${LIB_NAME}_tvos.a -headers $INCLUDE_DIR \
  -library $SOURCE_LIBRARY/lib${LIB_NAME}_tvsim.a -headers $INCLUDE_DIR \
  -output $FRAMEWORK_DEST/${LIB_NAME}.xcframework
