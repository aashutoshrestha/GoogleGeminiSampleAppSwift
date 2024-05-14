//
//  HomeView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/11/24.
//

import SwiftUI

/// The main view that presents a TabView for navigation between different sections of the app.
struct HomeView: View {
    var body: some View {
        TabView {
            
            // First Tab: BookView
            BookView()
                .tabItem {
                    Label("Book", systemImage: "books.vertical")
                }
            
            // Second Tab: CaptureBook
            CaptureBook()
                .tabItem {
                    Label("Capture Book", systemImage: "camera")
                }
            
            // Third Tab: SettingsView
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


