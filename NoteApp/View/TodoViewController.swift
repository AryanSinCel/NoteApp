import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = TodoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isEditing = true
        tableView.allowsMultipleSelectionDuringEditing = true
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem) {
        tableView.isEditing.toggle()
        sender.title = tableView.isEditing ? "Done" : "Edit"
        tableView.reloadData()
    }
    
    @IBAction func addTodo(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add To-dos", message: "Please Enter To-dos", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            if let todo = alertController.textFields?.first?.text, !todo.isEmpty {
                self.viewModel.addTodo(todo)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter Your Task"
        }
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
