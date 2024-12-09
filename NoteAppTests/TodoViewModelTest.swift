import XCTest
@testable import NoteApp

class TodoViewModelTests: XCTestCase {

    var viewModel: TodoViewModel!

    override func setUp() {
        super.setUp()
        viewModel = TodoViewModel()
        UserDefaults.standard.removeObject(forKey: "todos")
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadData() {
        let todos = [
            ["title": "Buy groceries", "isCompleted": false],
            ["title": "Walk the dog", "isCompleted": true]
        ]
        UserDefaults.standard.set(todos, forKey: "todos")
        
        viewModel.loadData()
        
        XCTAssertEqual(viewModel.numberOfRows(isSearching: false), 2, "The number of todos should match the stored data.")
        XCTAssertEqual(viewModel.todoAt(index: 0, isSearching: false).title, "Buy groceries", "The first todo should match the stored data.")
        XCTAssertEqual(viewModel.todoAt(index: 1, isSearching: false).isCompleted, true, "The second todo should be marked as completed.")
    }

    func testAddTodo() {
        let newTodoTitle = "Learn Swift"
        
        viewModel.addTodo(newTodoTitle)
        
        XCTAssertEqual(viewModel.numberOfRows(isSearching: false), 1, "There should be one todo in the list.")
        XCTAssertEqual(viewModel.todoAt(index: 0, isSearching: false).title, newTodoTitle, "The new todo should be added to the list.")
    }

    func testMarkTodoAsCompleted() {
        let todoTitle = "Buy groceries"
        viewModel.addTodo(todoTitle)
        
        viewModel.markTodoAsCompleted(at: 0, isSearching: false)
        
        XCTAssertTrue(viewModel.todoAt(index: 0, isSearching: false).isCompleted, "The todo should be marked as completed.")
    }

    func testRemoveCompletedTodo() {
        let todoTitle = "Buy groceries"
        viewModel.addTodo(todoTitle)
        viewModel.markTodoAsCompleted(at: 0, isSearching: false)
        
        viewModel.removeCompletedTodo(at: 0, isSearching: false)
        
        XCTAssertFalse(viewModel.todoAt(index: 0, isSearching: false).isCompleted, "The todo should be marked as not completed.")
    }

    func testDeleteTodoAt() {
        let todoTitle = "Buy groceries"
        viewModel.addTodo(todoTitle)
        
        viewModel.deleteTodoAt(index: 0)
        
        XCTAssertEqual(viewModel.numberOfRows(isSearching: false), 0, "The todo list should be empty after deletion.")
    }

    func testFilterTodos() {
        viewModel.addTodo("Buy groceries")
        viewModel.addTodo("Walk the dog")
        
        viewModel.filterTodos(with: "groceries")
        
        XCTAssertEqual(viewModel.filteredTodos.count, 1, "There should be one filtered todo.")
        XCTAssertEqual(viewModel.filteredTodos[0].title, "Buy groceries", "The filtered todo should match the search text.")
    }

    func testMoveTodo() {
        viewModel.addTodo("Buy groceries")
        viewModel.addTodo("Walk the dog")
        
        viewModel.moveTodo(from: 0, to: 1)
        
        XCTAssertEqual(viewModel.todoAt(index: 0, isSearching: false).title, "Walk the dog", "The first todo should now be 'Walk the dog'.")
        XCTAssertEqual(viewModel.todoAt(index: 1, isSearching: false).title, "Buy groceries", "The second todo should now be 'Buy groceries'.")
    }
}
