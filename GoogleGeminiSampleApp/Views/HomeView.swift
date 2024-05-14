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
        TabView { // Creates a tab bar interface for navigation

            // First Tab: BookView
            BookView() // Content of the first tab
                .tabItem {
                    Label("Book", systemImage: "books.vertical") // Label and icon for the tab
                }

            // Second Tab: CaptureBook
            CaptureBook() // Content of the second tab
                .tabItem {
                    Label("Capture Book", systemImage: "camera") // Label and icon for the tab
                }

            // Third Tab: SettingsView
            SettingsView() // Content of the third tab
                .tabItem {
                    Label("Settings", systemImage: "gear") // Label and icon for the tab
                }
        } // End of TabView
    }
}


