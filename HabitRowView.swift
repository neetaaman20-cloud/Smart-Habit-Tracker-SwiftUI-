import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let onComplete: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.name)
                    .font(.headline)
                Text("Streak: \(habit.streak) days")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button("Done") {
                onComplete()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}