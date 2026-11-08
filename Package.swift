// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "GeoKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "GeoKit",
            targets: ["GeoKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", from: "0.57.0"),
        .package(url: "https://github.com/PhoneNumberKit/PhoneNumberKit", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "GeoKit",
            dependencies: [
                .product(name: "PhoneNumberKit", package: "PhoneNumberKit")
            ],
            swiftSettings: [
                .enableExperimentalFeature("ApproachableConcurrency"),
                .defaultIsolation(MainActor.self),
                .swiftLanguageMode(.v6)
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "GeoKitTests",
            dependencies: ["GeoKit"],
            swiftSettings: [
                .enableExperimentalFeature("ApproachableConcurrency"),
                .defaultIsolation(MainActor.self),
                .swiftLanguageMode(.v6)
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]
        ),
    ]
)
