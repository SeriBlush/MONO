import Foundation
import SwiftUI

final class PlannerViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var tasks: [TaskItem] = []
    @Published var calendarEntries: [CalendarEntry] = []

    init() {
        seed()
    }

    func seed() {
        let today = Date()
        tasks = [
            TaskItem(title: "Deep work block", startTime: today, endTime: today.addingTimeInterval(60 * 60), priority: .high, subtasks: ["Outline goals", "Turn off notifications"]),
            TaskItem(title: "Review notes", startTime: today.addingTimeInterval(60 * 90), endTime: today.addingTimeInterval(60 * 120), priority: .medium)
        ]
        calendarEntries = [
            CalendarEntry(date: today, title: "Project milestone", notes: "Draft overview due"),
            CalendarEntry(date: Calendar.current.date(byAdding: .day, value: 1, to: today) ?? today, title: "Planning review")
        ]
    }
}
