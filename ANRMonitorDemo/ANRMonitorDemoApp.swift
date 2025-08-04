//
//  ANRMonitorDemoApp.swift
//  ANRMonitorDemo
//
//  Created by Anand on 04/08/25.
//

import SwiftUI
import ANRMonitor

@main
struct ANRMonitorDemoApp: App {
    
    init() {
        ANRMonitor.shared.start(threshold: 0.4) // Start ANR detection with 400ms threshold

        // Optional: log when ANR is detected
        ANRMonitor.shared.onANRDetected = { duration in
            print("🔥 ANR detected! Blocked for \(duration) seconds")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
