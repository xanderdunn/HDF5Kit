// swift-tools-version:5.0

import PackageDescription

// The latest Usage instructions were helpful: https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md#requiring-system-libraries

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
