import SwiftUI

@main
struct PlannerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tint(AppTheme.accent)
        }
    }
}
