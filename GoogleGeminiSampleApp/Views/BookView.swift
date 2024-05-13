//
//  BookView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

struct BookView: View {
    @State private var gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var searchText: String = ""
    @ObservedObject private var bookModel = BookViewModel()
    
    init(){
        
    }
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                if bookModel.booksResponse?.items.count ?? 0 <= 0 {
                    EmptyView().frame(width: geometry.size.width, height: geometry.size.height)
                }else{
                    ScrollView(.vertical){
                        LazyVGrid(columns: gridItems,alignment: .center){
                            ForEach(bookModel.booksResponse!.items, id: \.self){ book in
                                    BookContentView(book: book).frame(width: geometry.size.width/2, height: geometry.size.width/2).padding()
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Gemini Sample Book App").searchable(text: $searchText).onChange(of: searchText) { oldValue, newValue in
            
        }
        
    }
}

