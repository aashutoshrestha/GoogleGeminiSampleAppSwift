//
//  CameraView.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import SwiftUI
import AVFoundation
struct CaptureBook: View {
    
    @ObservedObject private var captureBookModel = CaptureBookViewModel()
    @ObservedObject private var speechModel = TextToSpeechManager()
    var body: some View{
        VStack {
            if let image = captureBookModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit().frame(height: 200).onAppear {
                        Task{
                            await captureBookModel.getImageResponse()
                        }
                    }
                if captureBookModel.responseBook == ""{
                    HStack(alignment: .center, spacing: 15) {
                        ProgressView()
                        Text("Loading…")
                    }
                }else{
                    if speechModel.speaking {
                        Button("Stop Listening") {
                            self.speechModel.stopSpeaking()
                        }
                    }else{
                        Button("Listen") {
                            self.speechModel.speak(text: self.captureBookModel.responseBook)
                        }
                    }
                    Text(captureBookModel.responseBook)
                }
            }
            Spacer()
            Button("Take a Picture") {
                self.captureBookModel.isShowingCaptureImageView.toggle()
            }
        }
        .sheet(isPresented: $captureBookModel.isShowingCaptureImageView) {
            CaptureImageView(isShown: self.$captureBookModel.isShowingCaptureImageView, image: $captureBookModel.image)
        }
    }
}
