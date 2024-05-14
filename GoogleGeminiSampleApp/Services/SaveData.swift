//
//  UserDefaults.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
class SaveData{
    let googleAPIKEY = "googleAPIKEY"
    let generativeAPIKEY = "generativeAPIKEY"
    
    let googleAPIKEYKey = "googleAPIKEY"
    let generativeAPIKEYKey = "generativeAPIKEY"
    
    // MARK: - Save values to UserDefaults
    
    func saveGoogleAPIKey(_ apiKey: String) {
        UserDefaults.standard.set(apiKey, forKey: googleAPIKEYKey)
    }
    
    func saveGenerativeAPIKey(_ apiKey: String) {
        UserDefaults.standard.set(apiKey, forKey: generativeAPIKEYKey)
    }
    
    // MARK: - Retrieve values from UserDefaults
    
    func getGoogleAPIKey() -> String? {
        return UserDefaults.standard.string(forKey: googleAPIKEYKey)
    }
    
    func getGenerativeAPIKey() -> String? {
        return UserDefaults.standard.string(forKey: generativeAPIKEYKey)
    }
}
