// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nlohmann-json",
     platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v4), .visionOS(.v1)
    ],
    products: [
        .library(name: "json", targets: ["json"]),
//        .library(name: "jsonFramework", targets: ["jsonFramework"]),
    ],
    targets: [
//        .target(
//            name: "json",
//            path: "single_include/nlohmann",
//            publicHeadersPath: "."
//        ),
        .binaryTarget(
            name: "json",
            url: "https://github.com/JuanCRoblesDev/json/releases/download/v3.12.1/json.xcframework.zip",
            checksum: "8a67fc9818e93d45116d1082092e9d8ee4db1cdd6cac6b7be271d65440ad625b"
        ),
    ],
    cxxLanguageStandard: .cxx11
)
