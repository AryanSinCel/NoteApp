import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var listBtn: UIBarButtonItem!

    let listViewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        collectionView.addGestureRecognizer(longPressGesture)
        
        loadData()
        print(loadData())

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideSearchBar))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTapOutsideSearchBar() {
        searchBar.resignFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    private func loadData() {
        listViewModel.arr = listViewModel.readData()
        listViewModel.filteredNotes = listViewModel.arr
        collectionView.reloadData()
    }


    @IBAction func showList(_ sender: UIBarButtonItem) {
        listViewModel.changeListingType()
        collectionView.reloadData()
    }
}
