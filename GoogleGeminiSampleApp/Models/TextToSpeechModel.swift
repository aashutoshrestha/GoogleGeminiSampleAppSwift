//
//  TextToSpeechModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import AVFoundation

// A class for managing text-to-speech functionality
class TextToSpeechManager: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    
    // Private instance of the AVSpeechSynthesizer for text-to-speech conversion
    private let synthesizer = AVSpeechSynthesizer()

    // Optional storage for the current speech utterance
    private var utterance: AVSpeechUtterance?
    
    // Start time of the current utterance for progress calculation
    private var startTime: Date?

    // Published properties for UI updates
    @Published var speaking: Bool = false  // Indicates if speech is in progress
    @Published var voice = AVSpeechSynthesisVoice(language: "alloy")  // Voice used for speech (default: Alloy)

    // Initializer to set up the speech synthesizer
    override init() {
        super.init()
        synthesizer.delegate = self // Assign self as the delegate for callbacks
    }

    // Function to start speaking the given text
    func speak(text: String) {
        stopSpeaking()               // Stop any ongoing speech first
        utterance = AVSpeechUtterance(string: text)  // Create a new utterance
        utterance?.voice = voice      // Set the chosen voice
        synthesizer.speak(utterance!) // Start speaking the utterance
        startTime = Date()           // Record the start time for progress tracking
        speaking = true             // Update the speaking status
    }

    // Function to immediately stop any ongoing speech
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
        startTime = nil // Reset start time
        speaking = false // Update the speaking status
    }

    // Function to calculate the progress of the current speech
    func getSpeechProgress() -> Float {
        guard let utterance = utterance, let startTime = startTime else { return 0.0 } // Ensure utterance and start time are available
        let elapsedTime = Date().timeIntervalSince(startTime) // Calculate elapsed time
        let progress = Float(elapsedTime) / Float(utterance.speechString.utf16.count) // Calculate progress based on character count
        return min(max(progress, 0.0), 1.0) // Clamp progress between 0 and 1
    }

    // Delegate method called when the synthesizer finishes speaking
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        startTime = nil
        speaking = false // Update speaking status after completion
    }
}
