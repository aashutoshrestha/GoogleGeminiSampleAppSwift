//
//  EmptyView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI

struct EmptyView: View {
    @State var isNoResult: Bool = false
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "magnifyingglass").font(.system(size: 60))
            if isNoResult{
                Text("Nothing to show")
            }else{
                Text("No result found.")
            }
            if isNoResult{
                Text("Try searching for something")
            }else{
                Text("Try searching for a different book or check book's spelling")
            }
            
        }
    }
}

