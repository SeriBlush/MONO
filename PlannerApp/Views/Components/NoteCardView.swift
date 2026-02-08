import SwiftUI

struct NoteCardView: View {
    let note: NoteItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.title)
                .font(AppTypography.headline())
                .foregroundColor(AppTheme.textPrimary)
            Text(note.body)
                .font(AppTypography.body())
                .foregroundColor(AppTheme.textSecondary)
                .lineLimit(3)
            HStack {
                Text(note.folder)
                    .font(AppTypography.caption())
                    .foregroundColor(AppTheme.textSecondary)
                Spacer()
                Text(note.updatedAt, style: .date)
                    .font(AppTypography.caption())
                    .foregroundColor(AppTheme.textSecondary)
            }
        }
        .themeCard()
    }
}
