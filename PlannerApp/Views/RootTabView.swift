import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            PlannerView()
                .tabItem {
                    Label("Planner", systemImage: "calendar")
                }
            FocusView()
                .tabItem {
                    Label("Focus", systemImage: "timer")
                }
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            TrackersView()
                .tabItem {
                    Label("Trackers", systemImage: "chart.line.uptrend.xyaxis")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .background(AppTheme.background)
    }
}
