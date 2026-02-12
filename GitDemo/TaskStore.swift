import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Learn Git basics"),
        Task(title: "Create first commit"),
        Task(title: "Try branching"),
        Task(title: "Make a pull request"),
        Task(title: "Merge a pull request"),
        
    ]

    func add(_ title: String) {
        tasks.append(Task(title: title))
    }

    func toggle(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
