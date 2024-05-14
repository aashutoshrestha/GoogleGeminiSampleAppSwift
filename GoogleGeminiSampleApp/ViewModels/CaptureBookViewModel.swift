//
//  CaptureBookViewModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import UIKit
import GoogleGenerativeAI

class CaptureBookViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var responseBook: String = ""           // Generated book response
    @Published var image: UIImage?                      // Captured book image
    @Published var isShowingCaptureImageView = false    // Controls capture image view
    @Published var isResponseWaiting: Bool = false      // Indicates ongoing response

    // MARK: - Private Properties

    private let model = GenerativeModel(name: "gemini-1.5-pro-latest", apiKey: Constants.generateAIKey)
    
    private let defaultPrompt = """
    Find out the title and generate a short summary of this book.
    In response, include the title and the summary.
    If book is not found, generate a simple description of what the image is about.
    """

    // MARK: - Prompt Generation

    /// Builds a prompt for book title/summary retrieval based on the book name.
    private func getBookPrompt(bookName: String) -> String {
        return "Find out the title and generate a short summary of the book \(bookName). In response, include the title and the summary."
    }

    // MARK: - Response Retrieval

    /// Asynchronously fetches a response from the AI model using an image.
    func getImageResponse() async {
        guard let bookImage = image else { return } // Safety check
        
        isResponseWaiting = true // Signal response is being processed

        do {
            let response = try await model.generateContent(defaultPrompt, bookImage)
            responseBook = response.text ?? "" // Update responseBook
            isResponseWaiting = false // Update isResponseWaiting
        } catch {
            // Error handling (consider replacing fatalError in production)
            fatalError("Error generating response: \(error.localizedDescription)")
        }
    }

    /// Asynchronously fetches a response from the AI model using a book name.
    func getBookResponse(bookName: String) async {
        isResponseWaiting = true // Signal response is being processed

        do {
            let prompt = getBookPrompt(bookName: bookName)
            let response = try await model.generateContent(prompt)
            responseBook = response.text ?? "" // Update responseBook
            isResponseWaiting = false // Reset response waiting flag
        } catch {
            // Error handling (consider replacing fatalError in production)
            fatalError("Error generating response: \(error.localizedDescription)")
        }
    }
}
