//
//  ANRReport.swift
//  ANRDetector
//
//  Created by Anand on 04/08/25.
//

import Foundation

/// A model that represents an ANR (Application Not Responding) event.
public struct ANRReport: CustomStringConvertible {
    public let date: Date
    public let mainThreadStack: [String]

    public init(date: Date, mainThreadStack: [String]) {
        self.date = date
        self.mainThreadStack = mainThreadStack
    }

    public var description: String {
        let formattedDate = ISO8601DateFormatter().string(from: date)
        return """
        \u{1F6A8} ANR Detected at: \(formattedDate)
        \u{1F4CD} Main Thread Stack:
        \(mainThreadStack.joined(separator: "\n"))
        """
    }
}
