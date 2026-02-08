import Foundation

struct FocusSession: Identifiable, Hashable, Codable {
    let id: UUID
    var startTime: Date
    var duration: TimeInterval
    var label: String

    init(id: UUID = UUID(), startTime: Date, duration: TimeInterval, label: String = "Focus") {
        self.id = id
        self.startTime = startTime
        self.duration = duration
        self.label = label
    }
}
