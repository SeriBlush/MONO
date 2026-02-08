import Foundation
import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var name: String = "Jamie"
    @Published var selectedTheme: ThemeOption = .system
    @Published var fontScale: Double = 1.0
    @Published var focusDuration: Double = 25
}

enum ThemeOption: String, CaseIterable, Identifiable {
    case light
    case dark
    case system

    var id: String { rawValue }
    var label: String { rawValue.capitalized }
}
