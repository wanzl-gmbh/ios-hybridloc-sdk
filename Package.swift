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
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/0.9.4/HybridlocSDK_v0.9.4.xcframework.zip",
            checksum: "60934e02becda60fb48b2e9c2c652dfaacfc835613ff81ccc6654b192741881c"
        )
    ]
)
