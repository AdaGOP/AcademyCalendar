//
//  Alarm.swift
//  AcademyAlarm
//
//  Created by User on 24/03/26.
//

import Foundation
import Observation

// NOTE:
// Use @Observable if you convert this model into a class.
// This allows each Alarm instance to manage its own mutable state,
// rather than relying on a parent ViewModel to store and update it.
//
// - struct (current):
//   Best for value semantics. State is managed externally (e.g., in a ViewModel).
//   Updates require replacing the whole value.
//
// - class + @Observable:
//   Best for shared, mutable state.
//   Each Alarm becomes a reference type, and SwiftUI will automatically
//   observe and react to property changes within the object.
struct Alarm: Identifiable {
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
