//
//  Alarm.swift
//  AcademyAlarm
//
//  Created by User on 24/03/26.
//

import Foundation
import Observation

/// @Observable Alarm Model
/// This model is used throughout all lessons to demonstrate different state management patterns.
/// The @Observable macro allows this class to work with SwiftUI's reactive system automatically.
// TODO: annotate with @Observable to make it reactive and compatible with SwiftUI
final class Alarm: Identifiable {
    let id: UUID
    var time: Date
    var label: String
    var isActive: Bool
    
    init(id: UUID = UUID(), time: Date = Date(), label: String = "Alarm", isActive: Bool = false) {
        self.id = id
        self.time = time
        self.label = label
        self.isActive = isActive
    }
    
    /// Helper to format time for display
    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: time)
    }
}
