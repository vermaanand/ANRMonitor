//
//  Package.swift
//  ANRDetector
//
//  Created by Anand on 04/08/25.
//

// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "ANRDetector",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ANRDetector",
            targets: ["ANRDetector"]
        ),
    ],
    targets: [
        .target(
            name: "ANRDetector",
            path: "ANRDetector/Sources/ANRDetector"
        ),
        .testTarget(
            name: "ANRDetectorTests",
            dependencies: ["ANRDetector"],
            path: "ANRDetectorTests"
        )
    ]
)
