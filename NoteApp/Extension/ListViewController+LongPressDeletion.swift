import UIKit

// MARK: - Long Press Deletion
extension ListViewController {
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            let point = gestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: point) {
                let noteToDelete = listViewModel.filteredNotes[indexPath.row]
                
                let alert = UIAlertController(
                    title: "Delete Note",
                    message: "Are you sure you want to delete this note?",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
                    self.listViewModel.delete(note: noteToDelete)
                    
                    // Remove from filteredNotes and arr
                    self.listViewModel.filteredNotes.remove(at: indexPath.row)
                    self.listViewModel.arr.removeAll {
                        $0.title == noteToDelete.title && $0.description == noteToDelete.description
                    }
                    
                    // Delete the item from the collection view
                    self.collectionView.deleteItems(at: [indexPath])
                })
                
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
