//
//  GoogleGeminiSampleAppTests.swift
//  GoogleGeminiSampleAppTests
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import XCTest
@testable import GoogleGeminiSampleApp

final class GoogleGeminiSampleAppTests: XCTestCase {
    
    
    var bookViewModel: BookViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        bookViewModel = BookViewModel()
    }
    
    override func tearDownWithError() throws {
        bookViewModel = nil
    }
    
    func testBookViewModel() throws {
        // Given
        let searchTerm = "Harry Potter"
        
        // When
        bookViewModel.fetchBooks(searchTerm: searchTerm)
        
        // Then
        XCTAssertTrue(bookViewModel.isLoading)
        
        // Wait for some time for the request to complete
        let expectation = XCTestExpectation(description: "Fetch Books")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.bookViewModel.booksResponse)
            XCTAssertFalse(self.bookViewModel.isLoading)
            XCTAssertNil(self.bookViewModel.error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
