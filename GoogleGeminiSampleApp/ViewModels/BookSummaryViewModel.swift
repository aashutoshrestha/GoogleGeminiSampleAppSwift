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
class BookSummaryViewModel: ObservableObject {
    @Published var responseBook : String = ""
    @Published var image: UIImage?
    @Published var isShowingCaptureImageView = false
    @Published var isResponseWaiting: Bool = false
    let model = GenerativeModel(name: "gemini-1.5-pro-latest", apiKey: Constants.generateAIKey)
    let prompt = "Find out the title and generate a short summary of this book. In response , include the title and the summary. If book is not found, generate a simple description of what the image is about."
    func getBookPrompt(bookName: String) -> String {
        let promptText = "Find out the title and generate a short summary of the book \(bookName). In response , include the title and the summary."
        return promptText
    }
    func getImageResponse() async{
        if let bookImage = image{
            do{
                let response = try await model.generateContent(prompt, bookImage)
                responseBook = response.text ?? ""
            }catch let ex{
                fatalError("There was an error generating response: \n \(ex.localizedDescription)")
            }
        }
    }
    func getBookResponse(bookName: String) async{
        do{
            let response = try await model.generateContent(getBookPrompt(bookName: bookName))
            responseBook = response.text ?? ""
        }catch let ex{
            fatalError("There was an error generating response: \n \(ex.localizedDescription)")
        }
    }
}
