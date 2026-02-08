import SwiftUI

struct AppTheme {
    static let background = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(red: 0.06, green: 0.07, blue: 0.08, alpha: 1) : UIColor(red: 0.96, green: 0.96, blue: 0.95, alpha: 1)
    })
    static let surface = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(red: 0.12, green: 0.12, blue: 0.13, alpha: 1) : UIColor.white
    })
    static let separator = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(white: 1, alpha: 0.08) : UIColor(white: 0, alpha: 0.08)
    })
    static let textPrimary = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(white: 0.95, alpha: 1) : UIColor(white: 0.12, alpha: 1)
    })
    static let textSecondary = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(white: 0.7, alpha: 1) : UIColor(white: 0.45, alpha: 1)
    })
    static let accent = Color(UIColor { trait in
        trait.userInterfaceStyle == .dark ? UIColor(white: 0.82, alpha: 1) : UIColor(white: 0.2, alpha: 1)
    })

    static let cornerRadius: CGFloat = 14
    static let cardPadding: CGFloat = 14

    static let shadow = Color.black.opacity(0.04)
}

struct ThemeCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(AppTheme.cardPadding)
            .background(AppTheme.surface)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
            .shadow(color: AppTheme.shadow, radius: 6, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous)
                    .stroke(AppTheme.separator, lineWidth: 0.5)
            )
    }
}

extension View {
    func themeCard() -> some View {
        modifier(ThemeCardStyle())
    }
}
