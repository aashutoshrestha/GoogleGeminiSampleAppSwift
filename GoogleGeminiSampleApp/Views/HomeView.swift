//
//  HomeView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            BookView().tabItem {
                Label("Book", systemImage: "books.vertical")
            }
            CameraView().tabItem {
                Label("Capture Book", systemImage: "camera")
            }
            
        }
    }
}

