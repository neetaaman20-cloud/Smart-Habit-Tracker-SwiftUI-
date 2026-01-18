import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habitName = ""
    let onAdd: (String) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Habit name", text: $habitName)
            }
            .navigationTitle("New Habit")
            .toolbar {
                Button("Save") {
                    onAdd(habitName)
                    dismiss()
                }
            }
        }
    }
}