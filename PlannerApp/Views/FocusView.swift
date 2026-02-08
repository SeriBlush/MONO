import SwiftUI

struct FocusView: View {
    @StateObject private var viewModel = FocusViewModel()
    @State private var customMinutes: Double = 25
    @State private var ambientSound = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                VStack(spacing: 16) {
                    Text(timeString)
                        .font(AppTypography.title(48))
                        .foregroundColor(AppTheme.textPrimary)
                        .opacity(viewModel.isRunning ? 1 : 0.8)
                        .animation(.easeInOut(duration: 0.6), value: viewModel.isRunning)
                    Text(viewModel.isRunning ? "Focus session" : "Ready when you are")
                        .font(AppTypography.body())
                        .foregroundColor(AppTheme.textSecondary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .themeCard()

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Duration")
                            .font(AppTypography.headline())
                            .foregroundColor(AppTheme.textPrimary)
                        Spacer()
                        Text("\(Int(customMinutes)) min")
                            .font(AppTypography.caption())
                            .foregroundColor(AppTheme.textSecondary)
                    }
                    Slider(value: $customMinutes, in: 5...60, step: 5)
                        .tint(AppTheme.accent)

                    Toggle("Ambient sound", isOn: $ambientSound)
                        .toggleStyle(SwitchToggleStyle(tint: AppTheme.accent))
                        .font(AppTypography.body())
                }
                .themeCard()

                Button(action: primaryAction) {
                    Text(viewModel.isRunning ? "End session" : "Start focus")
                        .font(AppTypography.headline())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(AppTheme.textPrimary.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
                }
                .foregroundColor(AppTheme.textPrimary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Recent sessions")
                        .font(AppTypography.headline())
                        .foregroundColor(AppTheme.textPrimary)
                    if viewModel.sessions.isEmpty {
                        Text("No sessions yet")
                            .font(AppTypography.caption())
                            .foregroundColor(AppTheme.textSecondary)
                    } else {
                        ForEach(viewModel.sessions) { session in
                            HStack {
                                Text(session.startTime, style: .time)
                                    .font(AppTypography.body())
                                Spacer()
                                Text("\(Int(session.duration / 60)) min")
                                    .font(AppTypography.caption())
                                    .foregroundColor(AppTheme.textSecondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .themeCard()
                Spacer()
            }
            .padding(20)
            .background(AppTheme.background)
            .navigationTitle("Focus")
        }
    }

    private var timeString: String {
        let minutes = Int(viewModel.remainingTime) / 60
        let seconds = Int(viewModel.remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func primaryAction() {
        if viewModel.isRunning {
            viewModel.stop()
        } else {
            viewModel.start(duration: customMinutes * 60)
        }
    }
}
