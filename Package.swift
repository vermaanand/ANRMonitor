//
//  Package.swift
//  ANRDetector
//
//  Created by Anand on 04/08/25.
//

// swift-tools-version:5.7
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
            path: "ANRDetector/Sources"
        ),
        .testTarget(
            name: "ANRDetectorTests",
            dependencies: ["ANRDetector"],
            path: "ANRDetectorTests"
        )
    ]
)

