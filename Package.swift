// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "HDF5Kit",
    products: [
        .library(name: "HDF5Kit", targets: ["HDF5Kit"]),
    ],
    targets: [
        .systemLibrary(name: "CHDF5"),
        .target(name: "HDF5Kit", dependencies: ["CHDF5"]),
        .testTarget(name: "HDF5KitTests", dependencies: ["HDF5Kit"]),
    ]
)
