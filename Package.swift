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
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/0.9.5/HybridlocSDK_v0.9.5.xcframework.zip",
            checksum: "434b9d982416d9f9b6d391d589c3d34ed7c8fdbe63dc7cea2fb85d22ce56bb44"
        )
    ]
)
