//
//  NoteAppTests.swift
//  NoteAppTests
//
//  Created by Atulkumar Tiwari on 09/12/24.
//

import XCTest
@testable import NoteApp

final class DetailsViewModelTest: XCTestCase {
    
    var detailViewModel: DetailsViewModel!
    
    override func setUp() {
        super.setUp()
        detailViewModel = DetailsViewModel()
    }
    
    override func tearDown() {
        detailViewModel = nil
        super.tearDown()
    }
    
    func testSaveNoteWithEmptyTitle()
    {
        detailViewModel.operationResult = { result in
            XCTAssertEqual(result, "Please enter a title.")
        }
        detailViewModel.saveNote(title: nil, description: "Sample Description")
    }
    
    func testSaveNoteWithValidInput() {
        detailViewModel.operationResult = { result in
            XCTAssertEqual(result, "Note added successfully.")
        }
        detailViewModel.saveNote(title: "Sample Title", description: "Sample Description")
    }
}
