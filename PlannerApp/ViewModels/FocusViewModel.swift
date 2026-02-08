import Foundation
import SwiftUI

final class FocusViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 25 * 60
    @Published var isRunning = false
    @Published var sessions: [FocusSession] = []

    private var timer: Timer?
    private var currentDuration: TimeInterval = 25 * 60

    func start(duration: TimeInterval) {
        currentDuration = duration
        remainingTime = duration
        isRunning = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }

    func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }

    private func tick() {
        guard remainingTime > 0 else {
            stop()
            let session = FocusSession(startTime: Date().addingTimeInterval(-currentDuration), duration: currentDuration)
            sessions.insert(session, at: 0)
            return
        }
        remainingTime -= 1
    }
}
