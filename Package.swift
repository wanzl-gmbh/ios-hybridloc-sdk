// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HybridlocSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "HybridlocSDK",
            targets: ["HybridlocSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "HybridlocSDK",
            url: "https://github.com/wanzl-gmbh/ios-hybridloc-sdk/releases/download/1.2.0/HybridlocSDK_v1.2.0.xcframework.zip",
            checksum: "3fa06da81d65156a6b114453a29c48769fb39458032e1682264f56dc7405b31f"
        )
    ]
)
