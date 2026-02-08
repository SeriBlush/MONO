import SwiftUI

struct TrackersView: View {
    @StateObject private var viewModel = TrackersViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.trackers) { tracker in
                        TrackerCardView(tracker: tracker)
                    }
                }
                .padding(20)
            }
            .background(AppTheme.background)
            .navigationTitle("Trackers")
        }
    }
}
