#!/bin/sh

zip -r ./xcframework/json.xcframework.zip ./xcframework/json.xcframework

echo "Calculating checksums"

echo "json.xcframework.zip:"
swift package compute-checksum ./xcframework/json.xcframework.zip >> ./xcframework/checksums.txt

cat ./xcframework/checksums.txt
