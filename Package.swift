// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSignInWith3rd_Google",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "WWSignInWith3rd_Google", targets: ["WWSignInWith3rd_Google"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWSignInWith3rd_Apple", .upToNextMinor(from: "1.1.0")),
        .package(url: "https://github.com/google/GoogleSignIn-iOS/", from: "7.0.0"),
    ],
    targets: [
        .target(name: "WWSignInWith3rd_Google",
                dependencies: [
                    "WWSignInWith3rd_Apple",
                    .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
                ],
                resources: [.copy("Privacy")]
               ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
