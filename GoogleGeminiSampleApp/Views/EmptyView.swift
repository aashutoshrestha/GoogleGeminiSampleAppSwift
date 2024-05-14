//
//  EmptyView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI

// Define a custom SwiftUI view called "EmptyView" to represent an empty state
struct EmptyView: View {
    
    // State variable to control whether to show "No results found" or "Nothing to show" message
    @State var isNoResult: Bool = false
    
    var body: some View {
        VStack(alignment: .center) { // Create a vertical stack to arrange content
            
            Image(systemName: "magnifyingglass").font(.system(size: 60))
            
            // Conditionally display different text messages based on the 'isNoResult' state
            if isNoResult {
                Text("Nothing to show")
            } else {
                Text("No result found.")
            }
            
            // Conditionally display different secondary messages based on the 'isNoResult' state
            if isNoResult {
                Text("Try searching for something")
            } else {
                Text("Try searching for a different book or check book's spelling")
            }
        }
    }
}

