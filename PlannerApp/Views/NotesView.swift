import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel = NotesViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SearchBar(text: $viewModel.searchText)
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredNotes) { note in
                            NoteCardView(note: note)
                        }
                    }
                }
            }
            .padding(20)
            .background(AppTheme.background)
            .navigationTitle("Notes")
        }
    }
}
