//
//  SettingsView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

struct SettingsView: View {
    /// I have used my own API Keys over here, This can be replaced with yours. This might be changed in the future.
    @State var booksApiKey: String = (SaveData().getGoogleAPIKey() ?? "AIzaSyC6ln3IGpVEQYQs0kxDbKYgil_Ql6aSEVQ")
    @State var generativeAIAPIKey: String = (SaveData().getGenerativeAPIKey() ?? "AIzaSyC4xsEGffooVm5FyjJhM5fcshJipiTVf0A")
    var body: some View {
        NavigationView { // Embed in NavigationView for a title bar and potential navigation
            VStack(alignment: .leading, spacing: 20) {
                
                Text("API Key Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Google Cloud API Key:")
                        .font(.headline)
                    TextField("Enter Google Cloud API Key", text: $booksApiKey)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Gemini Generative AI API Key:")
                        .font(.headline)
                    TextField("Enter Gemini Generative AI API Key", text: $generativeAIAPIKey)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                Button(action: {
                    // Check if the Google Books API key has been provided
                    if (booksApiKey != "")
                    {
                        // If the API key is not empty, save it using the SaveData class's saveGoogleAPIKey method
                        SaveData().saveGoogleAPIKey(booksApiKey);
                    }
                    
                    // Check if the Generative AI API key has been provided
                    if (generativeAIAPIKey != "")
                    {
                        // If the API key is not empty, save it using the SaveData class's saveGenerativeAPIKey method
                        SaveData().saveGenerativeAPIKey(generativeAIAPIKey);
                    }
                    
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
    
}

