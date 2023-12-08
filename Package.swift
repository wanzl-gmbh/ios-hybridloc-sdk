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
            checksum: "67341b78f31770495793e7d8d26809946c6e24451fd0f3328dcd0f61ea0629db"
        )
    ]
)
