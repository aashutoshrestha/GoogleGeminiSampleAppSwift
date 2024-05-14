//
//  Book.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI
import SDWebImageSwiftUI  // Import the library for loading images from the web

// View to display a book's cover image
struct BookContentView: View {

    // The book data item (passed in from the parent view)
    public var book: Item?

    var body: some View {
        // Load the book cover image from the web using SDWebImageSwiftUI
        WebImage(url: URL(string: book?.volumeInfo!.imageLinks?.thumbnail ?? ""))
            
            // Empty `onSuccess` closure (we might want to add code here to handle successful image loading)
            .onSuccess { image, data, cacheType in
                // This closure is called when the image is loaded successfully.
                // We can perform actions like setting a flag to indicate loading completion.
            }
            
            // Make the image resizable and scale it to fit its container
            .resizable().scaledToFit()
            
            // Expand the image's width to fill the available space
            .frame(maxWidth: .infinity)
    }
}
