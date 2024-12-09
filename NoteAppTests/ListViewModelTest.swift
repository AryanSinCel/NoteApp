import XCTest
@testable import NoteApp

class ListViewModelTests: XCTestCase {
    
    var viewModel: ListViewModel!
    var mockDBManager: MockDBManager!
    
    override func setUp() {
        super.setUp()
        mockDBManager = MockDBManager()
        viewModel = ListViewModel()
        viewModel.databaseManager = mockDBManager
    }
    
    override func tearDown() {
        viewModel = nil
        mockDBManager = nil
        super.tearDown()
    }
    
    func testChangeListingType() {
        
        XCTAssertTrue(viewModel.inColl)
        
        viewModel.changeListingType()
        XCTAssertFalse(viewModel.inColl)
        
        viewModel.changeListingType()
        XCTAssertTrue(viewModel.inColl)
    }
    
    func testReadData() {
        let note = NoteModel(title: "Test Note", description: "Test Description")
        mockDBManager.insert(title: note.title, description: note.description)
        
        let notes = viewModel.readData()
        XCTAssertEqual(notes.count, 1)
        XCTAssertEqual(notes.first?.title, "Test Note")
        XCTAssertEqual(notes.first?.description, "Test Description")
    }
    
    func testDeleteNote() {
        let note = NoteModel(title: "Test Note", description: "Test Description")
        mockDBManager.insert(title: note.title, description: note.description)
        
        var notes = viewModel.readData()
        XCTAssertEqual(notes.count, 1)
        
        viewModel.delete(note: note)
        
        notes = viewModel.readData()
        XCTAssertEqual(notes.count, 0)
    }
}
