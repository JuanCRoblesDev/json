#!/bin/sh
#

mkdir ./tmp

# clang -std=c++11 -c json.cpp -o ./tmp/json.o -I ../../single_include

# libtool -static -o ./tmp/json.a ./tmp/json.o

DEST_LIB="./tmp"

SOURCE_FILE="json.cpp"
LIB_NAME="json"
INCLUDE_DIR="../../single_include"

mkdir -p $DEST_LIB

# macOS
xcrun -sdk macosx clang++ -arch arm64 -arch x86_64 -std=c++11 -c $SOURCE_FILE -o $DEST_LIB/${LIB_NAME}_macos.o -I$INCLUDE_DIR
xcrun -sdk macosx libtool -static -o $DEST_LIB/lib${LIB_NAME}_macos.a $DEST_LIB/${LIB_NAME}_macos.o

# iOS Device
xcrun -sdk iphoneos clang++ -arch arm64 -std=c++11 -c $SOURCE_FILE -o $DEST_LIB/${LIB_NAME}_ios.o -I$INCLUDE_DIR
xcrun -sdk iphoneos libtool -static -o $DEST_LIB/lib${LIB_NAME}_ios.a $DEST_LIB/${LIB_NAME}_ios.o

# iOS Simulator
xcrun -sdk iphonesimulator clang++ -arch arm64 -std=c++11 -arch x86_64 -c $SOURCE_FILE -o $DEST_LIB/${LIB_NAME}_iossim.o -I$INCLUDE_DIR
xcrun -sdk iphonesimulator libtool -static -o $DEST_LIB/lib${LIB_NAME}_iossim.a $DEST_LIB/${LIB_NAME}_iossim.o

# tvOS Device
xcrun -sdk appletvos clang++ -arch arm64 -std=c++11 -c $SOURCE_FILE -o $DEST_LIB/${LIB_NAME}_tvos.o -I$INCLUDE_DIR
xcrun -sdk appletvos libtool -static -o $DEST_LIB/lib${LIB_NAME}_tvos.a $DEST_LIB/${LIB_NAME}_tvos.o

# tvOS Simulator
xcrun -sdk appletvsimulator clang++ -arch arm64 -std=c++11 -arch x86_64 -c $SOURCE_FILE -o $DEST_LIB/${LIB_NAME}_tvsim.o -I$INCLUDE_DIR
xcrun -sdk appletvsimulator libtool -static -o $DEST_LIB/lib${LIB_NAME}_tvsim.a $DEST_LIB/${LIB_NAME}_tvsim.o

# Cleanup
# rm $DEST_DIR/*.o $DEST_DIR/*.a
# rm -f $DEST_DIR
