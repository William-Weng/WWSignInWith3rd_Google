// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSignInWith3rd+Google",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "WWSignInWith3rd+Google", targets: ["WWSignInWith3rd+Google"]),
    ],
    dependencies: [
        .package(name: "WWSignInWith3rd+Apple", url: "https://github.com/William-Weng/WWSignInWith3rd_Apple", .upToNextMinor(from: "1.0.1")),
        .package(url: "https://github.com/google/GoogleSignIn-iOS/", from: "7.0.0"),
    ],
    targets: [
        .target(name: "WWSignInWith3rd+Google", dependencies: [
            "WWSignInWith3rd+Apple",
            .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
        ]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
