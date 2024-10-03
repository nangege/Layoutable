// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Layoutable",
    products: [
        .library(
            name: "Layoutable",
            targets: ["Layoutable"]
        )
    ],
    dependencies: [.package(url: "git@github.com:nangege/Cassowary.git", branch:"master")],
    targets: [
        .target(
            name: "Layoutable",
            dependencies: ["Cassowary"],
            path: "Layoutable/Sources"
        ),
        .testTarget(
            name: "LayoutableTests",
            dependencies: ["Layoutable"],
            path: "LayoutableTests"
        )
    ]
)
