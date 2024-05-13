//
//  Book.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct BookContentView: View {
    
    public var book: Item?
    
    var body: some View {
        WebImage(url: URL(string: book?.volumeInfo!.imageLinks?.thumbnail ?? ""))
            .onSuccess { image, data, cacheType in
                
            }
            .resizable()
    }
}
