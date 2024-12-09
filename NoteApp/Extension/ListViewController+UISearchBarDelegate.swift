import UIKit

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listViewModel.filteredNotes = listViewModel.arr
        } else {
            listViewModel.filteredNotes = listViewModel.arr.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        listViewModel.filteredNotes = listViewModel.arr
        collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
}
