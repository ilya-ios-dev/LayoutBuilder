// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LayoutBuilder",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "ConstraintLayoutBuilder", targets: ["ConstraintLayoutBuilder"]),
        .library(name: "KeyPathLayoutBuilder", targets: ["KeyPathLayoutBuilder"]),
    ],
    targets: [
        .target(name: "ConstraintLayoutBuilder", dependencies: []),
        .target(name: "KeyPathLayoutBuilder", dependencies: []),
    ]
)
