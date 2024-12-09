import UIKit

extension TodoViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterTodos(with: searchText)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.isSearching = false
        viewModel.filteredTodos = []
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
}
