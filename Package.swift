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
            checksum: "f5f78aa9555ff3fc59fe3d72b443d2ed1c7afff500b5eec4c20a1b5b634e0cfb"
        )
    ]
)
