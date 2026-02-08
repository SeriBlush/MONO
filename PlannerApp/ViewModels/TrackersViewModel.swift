import Foundation

final class TrackersViewModel: ObservableObject {
    @Published var trackers: [TrackerItem] = []

    init() {
        trackers = [
            TrackerItem(title: "Daily reading", type: .habit, entries: demoEntries()),
            TrackerItem(title: "Mood", type: .mood, entries: demoEntries()),
            TrackerItem(title: "Study focus", type: .study, entries: demoEntries())
        ]
    }

    private func demoEntries() -> [TrackerEntry] {
        let calendar = Calendar.current
        return (0..<7).compactMap { offset in
            guard let date = calendar.date(byAdding: .day, value: -offset, to: Date()) else { return nil }
            return TrackerEntry(id: UUID(), date: date, value: Double.random(in: 0.2...1.0))
        }
    }
}
