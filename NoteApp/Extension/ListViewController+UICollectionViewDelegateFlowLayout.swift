import UIKit

// MARK: - UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        if listViewModel.inColl {
            self.listBtn.image = UIImage(systemName: "list.bullet")
            return CGSize(width: collectionWidth / 2 - 20, height: collectionWidth / 2 - 10)
        } else {
            self.listBtn.image = UIImage(systemName: "circle.grid.2x2")
            return CGSize(width: collectionWidth - 20, height: collectionWidth / 2 - 30)
        }
    }
}
