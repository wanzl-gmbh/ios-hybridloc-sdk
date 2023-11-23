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
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/0.9.3/HybridlocSDK_v0.9.3.xcframework.zip",
            checksum: "848f39a82c94f465e31bb946a0ab10307949e59e4517f4bb5275164ed9d13429"
        )
    ]
)
