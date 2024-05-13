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
    @ObservedObject public var generateAIModel = GenerateAIModel()
    @State var responseBook : String = ""
    init(){
        generateAIModel.responseBook = responseBook
    }
    func getBookSummary(bookName: String) async {
        await generateAIModel.getBookResponse(bookName: bookName)
    }
}
