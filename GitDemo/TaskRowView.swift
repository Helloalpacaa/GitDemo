import SwiftUI

struct TaskRowView: View {
    @EnvironmentObject var store: TaskStore
    let task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    store.toggle(task)
                }

            Text(task.title)
                .strikethrough(task.isCompleted)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
        }
    }
}

#Preview {
    TaskRowView(task: Task(title: "Sample task"))
        .environmentObject(TaskStore())
}
