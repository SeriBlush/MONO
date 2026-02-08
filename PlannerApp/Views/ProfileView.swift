import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    profileHeader
                    settingsSection
                    dataSection
                }
                .padding(20)
            }
            .background(AppTheme.background)
            .navigationTitle("Profile")
        }
    }

    private var profileHeader: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(AppTheme.separator)
                .frame(width: 64, height: 64)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(AppTheme.textSecondary)
                )
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.name)
                    .font(AppTypography.headline())
                    .foregroundColor(AppTheme.textPrimary)
                Text("Offline-first planner")
                    .font(AppTypography.caption())
                    .foregroundColor(AppTheme.textSecondary)
            }
            Spacer()
        }
        .themeCard()
    }

    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Preferences")
                .font(AppTypography.headline())
                .foregroundColor(AppTheme.textPrimary)
            Picker("Theme", selection: $viewModel.selectedTheme) {
                ForEach(ThemeOption.allCases) { theme in
                    Text(theme.label).tag(theme)
                }
            }
            .pickerStyle(.segmented)

            VStack(alignment: .leading, spacing: 8) {
                Text("Font size")
                    .font(AppTypography.body())
                    .foregroundColor(AppTheme.textSecondary)
                Slider(value: $viewModel.fontScale, in: 0.8...1.2, step: 0.05)
                    .tint(AppTheme.accent)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Focus default")
                    .font(AppTypography.body())
                    .foregroundColor(AppTheme.textSecondary)
                Slider(value: $viewModel.focusDuration, in: 10...60, step: 5)
                    .tint(AppTheme.accent)
                Text("\(Int(viewModel.focusDuration)) minutes")
                    .font(AppTypography.caption())
                    .foregroundColor(AppTheme.textSecondary)
            }
        }
        .themeCard()
    }

    private var dataSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Data")
                .font(AppTypography.headline())
                .foregroundColor(AppTheme.textPrimary)
            Button("Export as PDF") {}
                .buttonStyle(SecondaryButtonStyle())
            Button("Export as JSON") {}
                .buttonStyle(SecondaryButtonStyle())
            Text("Privacy-first: no ads or analytics by default.")
                .font(AppTypography.caption())
                .foregroundColor(AppTheme.textSecondary)
        }
        .themeCard()
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.body())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(AppTheme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                    .stroke(AppTheme.separator, lineWidth: 0.5)
            )
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}
