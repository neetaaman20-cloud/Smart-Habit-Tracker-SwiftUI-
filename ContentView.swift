import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HabitViewModel()
    @State private var showAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.habits) { habit in
                    HabitRowView(habit: habit) {
                        viewModel.markCompleted(habit)
                    }
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
                Button(action: { showAddHabit = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddHabit) {
                AddHabitView { name in
                    viewModel.addHabit(name: name)
                }
            }
        }
    }
}