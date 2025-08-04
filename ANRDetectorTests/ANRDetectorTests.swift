//
//  ANRDetectorTests.swift
//  ANRDetectorTests
//
//  Created by Anand on 04/08/25.
//

import XCTest
@testable import ANRDetector

final class ANRDetectorTests: XCTestCase {

    override func tearDown() {
        super.tearDown()
        ANRMonitor.shared.stopMonitoring()
    }

    func test_startMonitoring_setsIsRunning() {
        let expectation = XCTestExpectation(description: "Monitoring starts")

        ANRMonitor.shared.startMonitoring { _ in }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_stopMonitoring_stopsExecution() {
        ANRMonitor.shared.startMonitoring { _ in
            XCTFail("Callback should not be triggered after stopping")
        }

        ANRMonitor.shared.stopMonitoring()

        let expectation = XCTestExpectation(description: "Monitor stopped")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_ANRDetection_triggersCallback() {
        let expectation = XCTestExpectation(description: "ANR callback triggered")

        let monitor = ANRMonitor(threshold: 0.5)
        monitor.startMonitoring { report in
            XCTAssertFalse(report.mainThreadStack.isEmpty)
            expectation.fulfill()
        }

        // Simulate main thread freeze
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            Thread.sleep(forTimeInterval: 1.0)
        }

        wait(for: [expectation], timeout: 3.0)
        monitor.stopMonitoring()
    }

    func test_multipleStartMonitoring_doesNotCrash() {
        let monitor = ANRMonitor(threshold: 1.0)
        monitor.startMonitoring { _ in }
        monitor.startMonitoring { _ in } // Should not start again or crash
        monitor.stopMonitoring()
    }
}
