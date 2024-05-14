//
//  SettingsView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI

struct SettingsView: View {
    @State var booksApiKey: String = (SaveData().getGoogleAPIKey() ?? "AIzaSyC6ln3IGpVEQYQs0kxDbKYgil_Ql6aSEVQ")
    @State var generativeAIAPIKey: String = (SaveData().getGenerativeAPIKey() ?? "AIzaSyC4xsEGffooVm5FyjJhM5fcshJipiTVf0A")
    var body: some View {
        NavigationView { // Embed in NavigationView for a title bar and potential navigation
            VStack(alignment: .leading, spacing: 20) { // Add spacing between elements

                Text("API Key Settings")
                    .font(.largeTitle) // Larger, prominent title
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 8) { // Align text fields to the left
                    Text("Google Cloud API Key:")
                        .font(.headline) // Slightly smaller heading for each field
                    TextField("Enter Google Cloud API Key", text: $booksApiKey)
                        .textFieldStyle(.roundedBorder) // Rounded borders look modern
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
                        .frame(maxWidth: .infinity) // Make button full width
                        .padding()
                        .background(Color.blue) // Color the button
                        .foregroundColor(.white) // White text
                        .cornerRadius(10) // Rounded corners
                }
            }
            .padding() // Add padding around the entire content
            .navigationTitle("Settings") // Set the navigation bar title
        }
    }

}

