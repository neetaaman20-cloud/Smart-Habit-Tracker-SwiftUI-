import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var streak: Int
    var lastCompletedDate: Date?

    init(name: String) {
        self.id = UUID()
        self.name = name
        self.streak = 0
        self.lastCompletedDate = nil
    }
}