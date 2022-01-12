// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LayoutBuilder",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "LayoutBuilder", targets: ["LayoutBuilder"]),
        .library(name: "KeyPathLayoutBuilder", targets: ["KeyPathLayoutBuilder"]),
    ],
    targets: [
        .target(name: "LayoutBuilder", dependencies: []),
        .target(name: "KeyPathLayoutBuilder", dependencies: []),
    ]
)
