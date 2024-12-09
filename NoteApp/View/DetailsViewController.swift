import UIKit

class DetailsViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    private var viewModel: DetailsViewModel = DetailsViewModel()
    
    var titleProp: String?
    var descriptionProp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    private func configureUI() {
        titleField.borderStyle = .none
        setupDescriptionFieldPlaceholder()
        descriptionField.delegate = self
        
        if let title = titleProp {
            titleField.text = title
            descriptionField.text = descriptionProp
            addBtn.title = "Edit"
            descriptionField.textColor = .black
        }
        
    }
    
    private func configureViewModel() {
        let initialNote = titleProp != nil ? NoteModel(title: titleProp!, description: descriptionProp!) : nil
        if let initialNote = initialNote{
            viewModel.intializeNotemodel(initialNote)
        }
        
        viewModel.operationResult = { [weak self] message in
            DispatchQueue.main.async {
                self?.showAlert(message: message)
                self?.dismissOrPopViewController()
            }
        }
    }
    
    
    @IBAction func addNoteAction(_ sender: UIBarButtonItem) {
        viewModel.saveNote(title: titleField.text, description: descriptionField.text)
        dismissOrPopViewController()
    }
    
    @IBAction func deleteNoteAction(_ sender: UIBarButtonItem) {
        viewModel.deleteNote()
        dismissOrPopViewController()
    }
    
    private func setupDescriptionFieldPlaceholder() {
        descriptionField.text = "Description"
        descriptionField.textColor = .lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Description" {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            setupDescriptionFieldPlaceholder()
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func dismissOrPopViewController() {
        if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else if navigationController != nil {
            navigationController?.popViewController(animated: true)
        }
    }
}
