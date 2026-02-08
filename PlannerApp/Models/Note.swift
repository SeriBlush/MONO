import Foundation

struct NoteItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var body: String
    var folder: String
    var updatedAt: Date

    init(id: UUID = UUID(), title: String, body: String, folder: String, updatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.body = body
        self.folder = folder
        self.updatedAt = updatedAt
    }
}
