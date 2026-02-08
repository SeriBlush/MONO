import SwiftUI

struct TaskRowView: View {
    let task: TaskItem

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top, spacing: 12) {
                Capsule()
                    .fill(priorityColor)
                    .frame(width: 6, height: 32)
                VStack(alignment: .leading, spacing: 4) {
                    Text(task.title)
                        .font(AppTypography.body())
                        .foregroundColor(AppTheme.textPrimary)
                    Text(timeRange)
                        .font(AppTypography.caption())
                        .foregroundColor(AppTheme.textSecondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(AppTheme.textSecondary)
            }
            if !task.subtasks.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(task.subtasks, id: \.self) { subtask in
                        Text("• \(subtask)")
                            .font(AppTypography.caption())
                            .foregroundColor(AppTheme.textSecondary)
                    }
                }
                .padding(.leading, 18)
            }
        }
        .padding(.vertical, 6)
        .accessibilityElement(children: .combine)
    }

    private var timeRange: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "\(formatter.string(from: task.startTime)) – \(formatter.string(from: task.endTime))"
    }

    private var priorityColor: Color {
        switch task.priority {
        case .low:
            return AppTheme.separator
        case .medium:
            return AppTheme.textSecondary
        case .high:
            return AppTheme.accent
        }
    }
}
