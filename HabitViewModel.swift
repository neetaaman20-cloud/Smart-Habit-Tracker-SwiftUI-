import Foundation

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            saveHabits()
        }
    }

    private let habitsKey = "habits_key"

    init() {
        loadHabits()
    }

    func addHabit(name: String) {
        let newHabit = Habit(name: name)
        habits.append(newHabit)
    }

    func markCompleted(_ habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }

        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = habits[index].lastCompletedDate

        if let lastDate = lastDate,
           Calendar.current.isDate(lastDate, inSameDayAs: today) {
            return
        }

        if let lastDate = lastDate,
           Calendar.current.dateComponents([.day], from: lastDate, to: today).day == 1 {
            habits[index].streak += 1
        } else {
            habits[index].streak = 1
        }

        habits[index].lastCompletedDate = today
    }

    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: habitsKey)
        }
    }

    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: habitsKey),
           let saved = try? JSONDecoder().decode([Habit].self, from: data) {
            habits = saved
        }
    }
}