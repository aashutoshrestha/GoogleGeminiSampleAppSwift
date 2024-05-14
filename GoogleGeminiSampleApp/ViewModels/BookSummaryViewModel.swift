//
//  BookSummaryViewModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import UIKit
import SwiftUI
import GoogleGenerativeAI

/// ViewModel responsible for handling book summary generation using the Google Generative AI model.
class BookSummaryViewModel: ObservableObject {
    // Published properties for UI updates
    @Published var responseBook: String = ""  /// The generated book summary.
    @Published var isResponseWaiting: Bool = false    /// Indicates if a response is being awaited.
    ///
    /// The Generative AI model instance.
    private let model = GenerativeModel(name: "gemini-1.5-pro-latest", apiKey: Constants.generateAIKey)

    /// Constructs the prompt for the AI model to generate a book summary.
    /// - Parameter bookName: The name of the book.
    /// - Returns: The formatted prompt string.
    private func getBookPrompt(bookName: String) -> String {
        return "Find out the title and generate a short summary of the book \(bookName). In response, include the title and the summary."
    }

    /// Asynchronously fetches and processes the book summary from the AI model.
    /// - Parameter bookName: The name of the book to summarize.
    func getBookResponse(bookName: String) async {
        isResponseWaiting = true // Indicate waiting for response
        defer { isResponseWaiting = false } // Ensure waiting state is reset

        do {
            let response = try await model.generateContent(getBookPrompt(bookName: bookName))
            responseBook = response.text ?? "" // Update with the response or empty string
        } catch {
            // Handle errors (e.g., display an error message to the user)
            print("Error generating response: \(error.localizedDescription)")
        }
    }
}
