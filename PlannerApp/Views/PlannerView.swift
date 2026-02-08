import SwiftUI

struct PlannerView: View {
    @StateObject private var viewModel = PlannerViewModel()
    @State private var selectedView: PlannerScope = .daily

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    Picker("View", selection: $selectedView) {
                        ForEach(PlannerScope.allCases) { scope in
                            Text(scope.label).tag(scope)
                        }
                    }
                    .pickerStyle(.segmented)

                    CalendarGridView(selectedDate: $viewModel.selectedDate, scope: selectedView)
                        .themeCard()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Today")
                            .font(AppTypography.headline())
                            .foregroundColor(AppTheme.textPrimary)
                        ForEach(viewModel.tasks) { task in
                            TaskRowView(task: task)
                        }
                    }
                    .themeCard()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Upcoming")
                            .font(AppTypography.headline())
                            .foregroundColor(AppTheme.textPrimary)
                        ForEach(viewModel.calendarEntries) { entry in
                            CalendarEntryRow(entry: entry)
                        }
                    }
                    .themeCard()
                }
                .padding(20)
            }
            .background(AppTheme.background)
            .navigationTitle("Planner")
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewModel.selectedDate, style: .date)
                .font(AppTypography.title())
                .foregroundColor(AppTheme.textPrimary)
            Text("Quiet planning for a focused day.")
                .font(AppTypography.body())
                .foregroundColor(AppTheme.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

enum PlannerScope: String, CaseIterable, Identifiable {
    case daily
    case weekly
    case monthly

    var id: String { rawValue }
    var label: String { rawValue.capitalized }
}
