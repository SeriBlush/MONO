import SwiftUI

struct CalendarGridView: View {
    @Binding var selectedDate: Date
    var scope: PlannerScope

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 6), count: 7)

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(scope.label + " View")
                    .font(AppTypography.headline())
                    .foregroundColor(AppTheme.textPrimary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(AppTheme.textSecondary)
            }
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(shortWeekdays, id: \.self) { day in
                    Text(day)
                        .font(AppTypography.caption())
                        .foregroundColor(AppTheme.textSecondary)
                }
                ForEach(1...28, id: \.self) { day in
                    Text("\(day)")
                        .font(AppTypography.body(14))
                        .foregroundColor(AppTheme.textPrimary)
                        .frame(maxWidth: .infinity, minHeight: 28)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(day == calendarDay ? AppTheme.separator : Color.clear)
                        )
                        .accessibilityLabel("Day \(day)")
                }
            }
        }
    }

    private var shortWeekdays: [String] {
        Calendar.current.shortWeekdaySymbols
    }

    private var calendarDay: Int {
        Calendar.current.component(.day, from: selectedDate)
    }
}
