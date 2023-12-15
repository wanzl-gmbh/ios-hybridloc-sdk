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
            checksum: "31b8fa3b3679b15bf2423de54a8852e9c2f8972422c035673a30b519913a021f"
        )
    ]
)
