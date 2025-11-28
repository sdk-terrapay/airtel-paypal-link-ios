// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TerraPaySDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TerraPaySDK",
            targets: ["TerraPaySDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "TerraPaySDK",
            path: "./Sources/TerraPaySDK.xcframework"
        )
    ]
)
