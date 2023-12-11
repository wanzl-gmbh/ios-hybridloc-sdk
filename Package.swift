// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HybridlocSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HybridlocSDK",
            targets: ["HybridlocSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "HybridlocSDK",
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/0.9.6/HybridlocSDK_v0.9.6.xcframework.zip",
            checksum: "2cf894b2b11476e7ac861dd5f4dc74140329e65e820137b6a554cf6d5e5ff14c"
        )
    ]
)
