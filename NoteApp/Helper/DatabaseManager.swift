import Foundation
import SQLite3


class DBManager {
    
    private var db: OpaquePointer?
    private let dbPath: String = "myDb.sqlite"
    
    init() {
        db = openDatabase()
        createTable()
    }

    private func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false)
            .appendingPathComponent(dbPath)
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            return db
        } else {
            print("Unable to open database.")
            return nil
        }
    }

    private func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT);"
        if sqlite3_exec(db, createTableString, nil, nil, nil) != SQLITE_OK {
            print("Error creating table.")
        }
    }

    func insert(title: String, description: String) {
        let insertStatementString = "INSERT INTO notes (title, description) VALUES ('\(title)', '\(description)');"
        if sqlite3_exec(db, insertStatementString, nil, nil, nil) != SQLITE_OK {
            print("Could not insert row.")
        }
    }
    
    func read() -> [NoteModel] {
        let queryStatementString = "SELECT * FROM notes;"
        var queryStatement: OpaquePointer?
        var notes: [NoteModel] = []

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let title = String(cString: sqlite3_column_text(queryStatement, 1))
                let description = String(cString: sqlite3_column_text(queryStatement, 2))
                notes.append(NoteModel(title: title, description: description))
            }
            sqlite3_finalize(queryStatement)
        } else {
            print("SELECT statement could not be prepared.")
        }
        
        return notes
    }

    func deleteByTitleAndDescription(title: String, description: String) {
        let deleteStatementString = "DELETE FROM notes WHERE title = '\(title)' AND description = '\(description)';"
        if sqlite3_exec(db, deleteStatementString, nil, nil, nil) != SQLITE_OK {
            print("Could not delete row.")
        }
    }
    
    func update(title: String, description: String) {
        let updateStatementString = "UPDATE notes SET description = '\(description)' WHERE title = '\(title)';"
        if sqlite3_exec(db, updateStatementString, nil, nil, nil) != SQLITE_OK {
            print("Could not update row.")
        }
    }
}
