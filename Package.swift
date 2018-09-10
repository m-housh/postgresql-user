// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PostgreSQLUser",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PostgreSQLUser",
            targets: ["PostgreSQLUser"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/m-housh/auth-user-core.git", from: "0.1.4"),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PostgreSQLUser",
            dependencies: ["AuthUserCore", "FluentPostgreSQL"]),
        .testTarget(
            name: "PostgreSQLUserTests",
            dependencies: ["PostgreSQLUser"]),
    ]
)
