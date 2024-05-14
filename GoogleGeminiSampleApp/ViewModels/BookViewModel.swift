//
//  BookViewModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import Alamofire

// MARK: - BookViewModel (ObservableObject)

class BookViewModel: ObservableObject {
    
    // MARK: - Published Properties

    @Published var booksResponse: GoogleBooksResponse? // Holds fetched book data
    @Published var isLoading = false                   // Indicates loading state
    @Published var error: Error? = nil                 // Stores any fetch errors

    // MARK: - Initialization

    init() {
        // Initialization logic 
    }

    // MARK: - Fetch Books

    /// Fetches book data from the Google Books API.
    ///
    /// - Parameter searchTerm: The term to search for.
    func fetchBooks(searchTerm: String) {
        isLoading = true // Start loading
        error = nil      // Clear previous errors

        // Build the API URL
        guard let url = URL(string: Constants.googleBooksAPIEndPoint(searchTerm: searchTerm)) else {
            fatalError("Invalid URL") // Crash on invalid URL (for development)
        }

        // Alamofire Request
        AF.request(url) // Simplified request without unnecessary parameters
            .response { [weak self] resp in // Capture self weakly to avoid memory leaks
                guard let self = self else { return } // Ensure self is valid

                defer { self.isLoading = false } // Stop loading in all cases

                switch resp.result {
                case .success(let data):
                    do {
                        // Decode JSON data
                        let jsonData = try JSONDecoder().decode(GoogleBooksResponse.self, from: data!)
                        self.booksResponse = jsonData
                    } catch {
                        // Handle decoding errors
                        self.error = error
                        print("Decoding error:", error.localizedDescription)
                    }
                case .failure(let error):
                    // Handle network errors
                    self.error = error
                    print("Network error:", error.localizedDescription)
                }
            }
    }
}
