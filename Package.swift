// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppleDesignSystem",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "AppleDesignSystem",
            targets: ["AppleDesignSystem"]
        ),
    ],
    dependencies: [
        // Add dependencies here if needed
    ],
    targets: [
        .target(
            name: "AppleDesignSystem",
            dependencies: [],
            path: "Sources/AppleDesignSystem",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "AppleDesignSystemTests",
            dependencies: ["AppleDesignSystem"],
            path: "Tests/AppleDesignSystemTests"
        ),
    ],
    swiftLanguageModes: [.v5]
)
