//
//  TextToSpeechModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import AVFoundation

class TextToSpeechManager: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    private let synthesizer = AVSpeechSynthesizer()
    private var utterance: AVSpeechUtterance?
    private var startTime: Date?
    @Published var speaking: Bool = false
    @Published var voice = AVSpeechSynthesisVoice(language: "alloy")
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func speak(text: String) {
        stopSpeaking()
        utterance = AVSpeechUtterance(string: text)
        utterance?.voice = voice
        synthesizer.speak(utterance!)
        startTime = Date()
        speaking = true
    }
    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
        startTime = nil
        speaking = false
    }
    
    func getSpeechProgress() -> Float {
        guard let utterance = utterance, let startTime = startTime else { return 0.0 }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let progress = Float(elapsedTime) / Float(utterance.speechString.utf16.count)
        return min(max(progress, 0.0), 1.0)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        startTime = nil
        speaking = false
    }
}
