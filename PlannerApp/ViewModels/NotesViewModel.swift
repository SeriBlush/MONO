import Foundation

final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteItem] = []
    @Published var searchText: String = ""

    init() {
        notes = [
            NoteItem(title: "Weekly reflection", body: "- Wins\n- Open loops\n- Next steps", folder: "Personal"),
            NoteItem(title: "Meeting notes", body: "## Agenda\n- Timeline\n- Open questions", folder: "Work")
        ]
    }

    var filteredNotes: [NoteItem] {
        guard !searchText.isEmpty else { return notes }
        return notes.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.body.localizedCaseInsensitiveContains(searchText) }
    }
}
