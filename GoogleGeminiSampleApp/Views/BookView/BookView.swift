//
//  BookView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

// View to display a grid of books and handle search functionality
struct BookView: View {
    
    // State variables for grid layout and search text
    @State private var gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Two flexible columns in the grid
    @State private var searchText: String = ""

    // ObservedObject to fetch and manage book data
    @ObservedObject private var bookModel = BookViewModel()

    // Empty initializer (not used in this case)
    init() { }

    var body: some View {
        NavigationView { // Wrap content in a NavigationView for search bar and navigation
            GeometryReader { geometry in // Get the size of the available space
                if bookModel.booksResponse?.items.count ?? 0 <= 0 {
                    // If no books are found, display an EmptyView
                    EmptyView().frame(width: geometry.size.width, height: geometry.size.height)
                } else {
                    // If books are found, display them in a scrollable grid
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridItems, alignment: .center) {
                            ForEach(bookModel.booksResponse!.items, id: \.self) { book in
                                // Create a NavigationLink for each book to navigate to its details
                                NavigationLink(destination: BookSummaryView(bookTitle: book.volumeInfo?.title ?? "")) {
                                    // Display the book content in a view with specified dimensions
                                    BookContentView(book: book).frame(width: geometry.size.width/2, height: geometry.size.width/2).padding()
                                }
                            }
                        }
                    }
                }
            }
        }
        // Add a searchable modifier to the NavigationView
        .searchable(text: $searchText)

        // Trigger search action when the user submits the search query
        .onSubmit(of: .search) {
            // Fetch books if the search text has more than 3 characters
            if searchText.count > 3 {
                bookModel.fetchBooks(searchTerm: searchText)
            } else { // Clear the results if the search text is too short
                bookModel.booksResponse = nil
            }
        }
    }
}
