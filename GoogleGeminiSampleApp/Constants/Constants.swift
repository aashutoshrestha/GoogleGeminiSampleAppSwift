//
//  Constants.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
class Constants{
    static let googleBooksAPIKey = ""
    static func googleBooksAPIEndPoint(searchTerm: String) -> String
    {
        return "https://www.googleapis.com/books/v1/volumes?q=\(searchTerm)&key=\(googleBooksAPIKey)"
    }
}
