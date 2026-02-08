import SwiftUI

struct TrackerCardView: View {
    let tracker: TrackerItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(tracker.title)
                        .font(AppTypography.headline())
                        .foregroundColor(AppTheme.textPrimary)
                    Text(tracker.type.rawValue.capitalized)
                        .font(AppTypography.caption())
                        .foregroundColor(AppTheme.textSecondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(AppTheme.textSecondary)
            }
            GraphDotsView(entries: tracker.entries)
        }
        .themeCard()
    }
}

struct GraphDotsView: View {
    let entries: [TrackerEntry]

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(entries.sorted(by: { $0.date < $1.date })) { entry in
                Circle()
                    .fill(AppTheme.textPrimary.opacity(0.4 + 0.5 * entry.value))
                    .frame(width: 8, height: 8)
            }
        }
        .accessibilityLabel("Weekly trend")
    }
}
