import SwiftUI

struct CalendarEntryRow: View {
    let entry: CalendarEntry

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.title)
                    .font(AppTypography.body())
                    .foregroundColor(AppTheme.textPrimary)
                Text(entry.date, style: .date)
                    .font(AppTypography.caption())
                    .foregroundColor(AppTheme.textSecondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(AppTheme.textSecondary)
        }
        .padding(.vertical, 6)
    }
}
