import UIKit

// MARK: - UICollectionViewDataSource
extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listViewModel.filteredNotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.notesDescription.frame.size.width = cell.frame.size.width - 20

        cell.titleLabel.text = listViewModel.filteredNotes[indexPath.row].title
        cell.notesDescription.text = listViewModel.filteredNotes[indexPath.row].description
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity =  0.5
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 2
        cell.layer.shouldRasterize = false
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1.5
        
        return cell
    }
}
