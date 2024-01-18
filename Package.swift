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
            checksum: "e9624424e1ddeee326b8ad87c556e2fc3b27356a51d92619f8c2d9f67ba6ba57"
        )
    ]
)
