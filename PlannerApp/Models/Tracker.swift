import Foundation

enum TrackerType: String, CaseIterable, Codable {
    case habit
    case mood
    case study
}

struct TrackerEntry: Identifiable, Hashable, Codable {
    let id: UUID
    var date: Date
    var value: Double
}

struct TrackerItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var type: TrackerType
    var entries: [TrackerEntry]

    init(id: UUID = UUID(), title: String, type: TrackerType, entries: [TrackerEntry] = []) {
        self.id = id
        self.title = title
        self.type = type
        self.entries = entries
    }
}
