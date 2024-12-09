import Foundation

class DetailsViewModel {
    private let dbManager = DBManager()
    var currentNote: NoteModel?
    
    var operationResult: ((String) -> Void)?
    
    func intializeNotemodel(_ note: NoteModel){
        self.currentNote = note
    }
    
    func saveNote(title: String?, description: String?) {
        guard let title = title, !title.isEmpty else {
            operationResult?("Please enter a title.")
            return
        }
        
        guard let description = description, !description.isEmpty else {
            operationResult?("Please enter a description.")
            return
        }
        
        if currentNote == nil {
            dbManager.insert(title: title, description: description)
            operationResult?("Note added successfully.")
        } else {
            dbManager.update(title: title, description: description)
            operationResult?("Note updated successfully.")
        }
    }
    
    func deleteNote() {
        guard let note = currentNote else {
            operationResult?("No note to delete.")
            return
        }
        dbManager.deleteByTitleAndDescription(title: note.title, description: note.description)
        operationResult?("Note deleted successfully.")
    }
}
