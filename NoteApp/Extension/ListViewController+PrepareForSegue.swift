import UIKit

// MARK: - Prepare for Segue
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNote",
           let destinationVC = segue.destination as? DetailsViewController,
           let selectedCell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: selectedCell) {
            let selectedNote = listViewModel.filteredNotes[indexPath.row]
            destinationVC.titleProp = selectedNote.title
            destinationVC.descriptionProp = selectedNote.description
        }
    }
}
