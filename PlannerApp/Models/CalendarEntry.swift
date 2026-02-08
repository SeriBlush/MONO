import Foundation

struct CalendarEntry: Identifiable, Hashable, Codable {
    let id: UUID
    var date: Date
    var title: String
    var notes: String

    init(id: UUID = UUID(), date: Date, title: String, notes: String = "") {
        self.id = id
        self.date = date
        self.title = title
        self.notes = notes
    }
}
