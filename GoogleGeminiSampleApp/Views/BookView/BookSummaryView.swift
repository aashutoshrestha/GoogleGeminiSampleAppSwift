//
//  BookSummaryView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

// View to display a summary of a book and provide text-to-speech functionality
struct BookSummaryView: View {
    // Title of the book to fetch and display summary for (passed from the parent view)
    var bookTitle: String = ""

    // ViewModel for fetching and managing book summary data
    @ObservedObject private var bookContentModel = BookSummaryViewModel()

    // ViewModel for managing text-to-speech functionality
    @ObservedObject private var speechModel = TextToSpeechManager()

    var body: some View {
        // Conditionally display loading state or book summary and controls
        if bookContentModel.responseBook == "" { // While loading the summary
            HStack(alignment: .center, spacing: 15) {
                ProgressView() // Display a progress indicator
                Text("Loading…") // Inform the user that the content is loading

                // Trigger fetching of the book summary when the view appears
                .onAppear {
                    Task {
                        await bookContentModel.getBookResponse(bookName: bookTitle)
                    }
                }
            }
        } else { // Summary is available
            
            // Conditional button for "Stop Listening" or "Listen"
            if speechModel.speaking {
                Button("Stop Listening") {
                    self.speechModel.stopSpeaking()
                }
            } else {
                Button("Listen") {
                    self.speechModel.speak(text: self.bookContentModel.responseBook)
                }
            }

            // Display the book summary text
            Text(bookContentModel.responseBook)
        }
    }
}
