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
            NavigationView{
                BookView()
            }.tabItem {
                Label("Book", systemImage: "books.vertical")
            }
            NavigationView{
                CaptureBook()
            }.tabItem {
                Label("Capture Book", systemImage: "camera")
            }
            NavigationView{
                SettingsView()
            }.tabItem {
                Label("Settings", systemImage: "gear")
            }
            
        }
    }
}

