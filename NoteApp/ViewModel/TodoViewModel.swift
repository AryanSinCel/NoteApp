import Foundation

class TodoViewModel {
    
    private var todos: [Todo] = []
    var filteredTodos: [Todo] = []
    var isSearching: Bool = false
    
    let userDefaults = UserDefaults.standard

    func loadData() {
        if let savedTodos = userDefaults.value(forKey: "todos") as? [[String: Any]] {
            todos = savedTodos.map {
                Todo(title: $0["title"] as! String, isCompleted: $0["isCompleted"] as! Bool)
            }
        }
        print("Todos: \(todos)")
    }
    
    private func saveData() {
        let data = todos.map { ["title": $0.title, "isCompleted": $0.isCompleted] }
        userDefaults.set(data, forKey: "todos")
    }
    
    func numberOfRows(isSearching: Bool) -> Int {
        return isSearching ? filteredTodos.count : todos.count
    }
    
    func todoAt(index: Int, isSearching: Bool) -> Todo {
        return isSearching ? filteredTodos[index] : todos[index]
    }

    func addTodo(_ title: String) {
        todos.append(Todo(title: title, isCompleted: false))
        saveData()
    }
    
    func markTodoAsCompleted(at index: Int, isSearching: Bool) {
        if isSearching {
            let todo = filteredTodos[index]
            if let originalIndex = todos.firstIndex(where: { $0.title == todo.title }) {
                todos[originalIndex].isCompleted = true
            }
        } else {
            todos[index].isCompleted = true
        }
        saveData()
    }
    
    func removeCompletedTodo(at index: Int, isSearching: Bool) {
        if isSearching {
            let todo = filteredTodos[index]
            if let originalIndex = todos.firstIndex(where: { $0.title == todo.title }) {
                todos[originalIndex].isCompleted = false
            }
        } else {
            todos[index].isCompleted = false
        }
        saveData()
    }
    
    func deleteTodoAt(index: Int) {
        todos.remove(at: index)
        saveData()
    }
    
    func filterTodos(with searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredTodos = []
        } else {
            isSearching = true
            filteredTodos = todos.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func moveTodo(from sourceIndex: Int, to destinationIndex: Int) {
        todos.swapAt(sourceIndex, destinationIndex)
        saveData()
    }
}
