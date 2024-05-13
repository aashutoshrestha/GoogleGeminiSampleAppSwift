//
//  BookSummaryView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

struct BookSummaryView: View {
    var bookTitle: String = ""
    @ObservedObject private var bookContentModel = CaptureBookViewModel()
    @ObservedObject private var speechModel = TextToSpeechManager()
    var body: some View {
        if bookContentModel.responseBook == ""{
            HStack(alignment: .center, spacing: 15) {
                ProgressView()
                Text("Loading…").onAppear {
                    Task {
                        await bookContentModel.getBookResponse(bookName: bookTitle)
                    }
                }
            }
        }else{
            if speechModel.speaking {
                Button("Stop Listening") {
                    self.speechModel.stopSpeaking()
                }
            }else{
                Button("Listen") {
                    self.speechModel.speak(text: self.bookContentModel.responseBook)
                }
            }
            Text(bookContentModel.responseBook)
        }
    }
}
