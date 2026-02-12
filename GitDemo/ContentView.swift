import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: TaskStore
    @State private var showingAddTask = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.tasks) { task in
                    TaskRowView(task: task)
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddTask = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(TaskStore())
}
