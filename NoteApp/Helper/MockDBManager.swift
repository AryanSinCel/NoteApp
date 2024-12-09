//
//  MockDBManager.swift
//  NoteApp
//
//  Created by Celestial on 09/12/24.
//

import Foundation

class MockDBManager: DBManager {
    var mockData: [NoteModel] = []
    
    override func read() -> [NoteModel] {
        return mockData
    }
    
    override func deleteByTitleAndDescription(title: String, description: String) {
        mockData.removeAll { $0.title == title && $0.description == description }
    }
    
    override func insert(title: String, description: String) {
        mockData.append(NoteModel(title: title, description: description))
    }
    
    override func update(title: String, description: String) {
        if let index = mockData.firstIndex(where: { $0.title == title }) {
            mockData[index] = NoteModel(title: title, description: description)
        }
    }
}
