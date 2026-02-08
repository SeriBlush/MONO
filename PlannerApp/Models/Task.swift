import Foundation

enum TaskPriority: String, CaseIterable, Codable {
    case low
    case medium
    case high
}

struct TaskItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var startTime: Date
    var endTime: Date
    var priority: TaskPriority
    var subtasks: [String]
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        title: String,
        startTime: Date,
        endTime: Date,
        priority: TaskPriority = .medium,
        subtasks: [String] = [],
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.priority = priority
        self.subtasks = subtasks
        self.isCompleted = isCompleted
    }
}
