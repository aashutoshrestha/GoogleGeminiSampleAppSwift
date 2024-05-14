//
//  CameraView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI
import AVFoundation

// View to capture an image of a book and display extracted text/audio
struct CaptureBook: View {

    // ViewModel for handling image capture, processing, and API responses
    @ObservedObject private var captureBookModel = CaptureBookViewModel()
    
    // ViewModel for managing text-to-speech functionality
    @ObservedObject private var speechModel = TextToSpeechManager()

    var body: some View {
        VStack { // Main vertical container for content

            // Conditionally display image and processed text
            if let image = captureBookModel.image {
                Image(uiImage: image) // Display captured image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .onAppear { // When image appears, trigger text extraction
                        Task {
                            await captureBookModel.getImageResponse()
                        }
                    }
                
                // Conditionally display loading indicator or text/audio controls
                if captureBookModel.responseBook == "" { // Loading state
                    HStack(alignment: .center, spacing: 15) {
                        ProgressView()
                        Text("Loading…")
                    }
                } else { // Text available

                    // Conditional button: "Stop Listening" or "Listen"
                    if speechModel.speaking {
                        Button("Stop Listening") {
                            self.speechModel.stopSpeaking()
                        }
                    } else {
                        Button("Listen") {
                            self.speechModel.speak(text: self.captureBookModel.responseBook)
                        }
                    }

                    // Display extracted text from the book
                    Text(captureBookModel.responseBook)
                }
            }
            
            Spacer() // Push the button to the bottom

            // Button to trigger image capture (opens a modal sheet)
            Button("Take a Picture") {
                // Reset state before capturing new image
                self.captureBookModel.responseBook = ""
                self.captureBookModel.image = nil
                self.captureBookModel.isShowingCaptureImageView.toggle()
            }
        }

        // Sheet to present the image capture view
        .sheet(isPresented: $captureBookModel.isShowingCaptureImageView) {
            CaptureImageView(isShown: self.$captureBookModel.isShowingCaptureImageView, image: $captureBookModel.image)
        }
    }
}
