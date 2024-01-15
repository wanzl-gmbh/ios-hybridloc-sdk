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
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/1.0.0/HybridlocSDK_v1.0.0.xcframework.zip",
            checksum: "72005676064601703e5b29de3d8eb4ea12dbf036f622f5a59d341f236008d839"
        )
    ]
)
