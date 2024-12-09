//
//  ListViewModel.swift
//  NoteApp
//
//  Created by Celestial on 09/12/24.
//

import Foundation

class ListViewModel{
    
    var databaseManager: DBManager
        
        init(databaseManager: DBManager = DBManager()) {
            self.databaseManager = databaseManager
        }
        
    var arr: [NoteModel] = []
    var filteredNotes: [NoteModel] = []
    var inColl: Bool = true

    func changeListingType(){
        inColl = !inColl
    }

    func readData()->[NoteModel]{
        return databaseManager.read()
    }
    
    func delete(note:NoteModel){
        databaseManager.deleteByTitleAndDescription(title: note.title, description: note.description)
    }
    
    
}
