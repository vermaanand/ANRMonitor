//
//  ANRMonitorDemoApp.swift
//  ANRMonitorDemo
//
//  Created by Anand on 04/08/25.
//

import SwiftUI
import ANRDetector

@main
struct ANRMonitorDemoApp: App {
    let monitorying: ANRMonitor
    init() {
        monitorying = ANRMonitor(threshold: 0.4) // Start ANR detection with 400ms threshold

        // Optional: log when ANR is detected
        monitorying.startMonitoring { report in
            print("🔥 ANR Detected :\(report.description)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
