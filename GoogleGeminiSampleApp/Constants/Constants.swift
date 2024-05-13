//
//  Constants.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
class Constants{
    static let googleBooksAPIKey = "AIzaSyC6ln3IGpVEQYQs0kxDbKYgil_Ql6aSEVQ"
    static let generateAIKey = "AIzaSyC4xsEGffooVm5FyjJhM5fcshJipiTVf0A"
    static func googleBooksAPIEndPoint(searchTerm: String) -> String
    {
        return "https://www.googleapis.com/books/v1/volumes?q=\(searchTerm)&key=\(googleBooksAPIKey)"
    }
}
