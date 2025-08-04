//
//  ANRDetector.swift
//  ANRDetector
//
//  Created by Anand on 04/08/25.
//

import Foundation
import os.log

/// A generic, production-ready ANR detector SDK using RunLoop Observer.
public final class ANRMonitor {

    public static let shared = ANRMonitor()

    private var isRunning = false
    private let detectionThreshold: TimeInterval
    private var lastPing: CFAbsoluteTime = 0
    private var observer: CFRunLoopObserver?
    private var monitorThread: Thread?

    private var onReportGenerated: ((ANRReport) -> Void)?

    /// Initializes the detector with a threshold (in seconds).
    /// - Parameter threshold: Time interval after which UI lag is considered ANR. Default is 1.5 seconds.
    public init(threshold: TimeInterval = 1.5) {
        self.detectionThreshold = threshold
    }

    /// Starts monitoring the main thread for ANRs.
    /// - Parameter report: A callback triggered when ANR is detected.
    public func startMonitoring(report: @escaping (ANRReport) -> Void) {
        guard !isRunning else {
            log("ANR monitoring already started.")
            return
        }

        isRunning = true
        onReportGenerated = report

        var runLoopContext = CFRunLoopGetMain()
        let activities: CFRunLoopActivity = [
            .beforeSources,
            .afterWaiting
        ]

        observer = CFRunLoopObserverCreateWithHandler(nil, activities.rawValue, true, 0) { [weak self] _, activity in
            guard let self = self else { return }
            self.lastPing = CFAbsoluteTimeGetCurrent()
        }

        if let observer = observer {
            CFRunLoopAddObserver(runLoopContext, observer, .commonModes)
        }

        monitorThread = Thread(target: self, selector: #selector(monitorLoop), object: nil)
        monitorThread?.qualityOfService = .background
        monitorThread?.start()

        log("Started ANR monitoring using RunLoopObserver with threshold: \(detectionThreshold) seconds")
    }

    /// Stops monitoring for ANRs.
    public func stopMonitoring() {
        guard isRunning else {
            log("ANR monitoring already stopped.")
            return
        }

        isRunning = false
        if let observer = observer {
            CFRunLoopRemoveObserver(CFRunLoopGetMain(), observer, .commonModes)
        }
        observer = nil
        monitorThread?.cancel()
        monitorThread = nil

        log("Stopped ANR monitoring.")
    }

    @objc private func monitorLoop() {
        while isRunning && !Thread.current.isCancelled {
            let elapsed = CFAbsoluteTimeGetCurrent() - lastPing
            if elapsed > detectionThreshold {
                DispatchQueue.main.async { [weak self] in
                    self?.handleANRDetected()
                }
                Thread.sleep(forTimeInterval: detectionThreshold)
            }
            Thread.sleep(forTimeInterval: 0.1)
        }
    }

    private func handleANRDetected() {
        let report = ANRReport(
            date: Date(),
            mainThreadStack: Thread.callStackSymbols
        )

        log("\u{26A1}\u{FE0F} ANR Detected at \(report.date)")
        log(report.description)

        onReportGenerated?(report)
    }

    /// Logs internal messages for debugging.
    private func log(_ message: String) {
        #if DEBUG
        print("[ANRDetector] \(message)")
        #else
        os_log("[ANRDetector] %{public}@", log: OSLog.default, type: .info, message)
        #endif
    }
}
