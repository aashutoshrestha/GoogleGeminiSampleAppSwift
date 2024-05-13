# Google Gemini Sample App Swift

This app utilizes Google's generative AI to generate book summaries from books fetched using Google's Book API. Additionally, it leverages Google's generative AI to generate summaries of books captured using the camera API of Apple. The app follows the MVVM (Model-View-ViewModel) architecture and includes some test cases to ensure proper functionality.

## Features

- Fetches books using Google's Book API.
- Utilizes Google's generative AI to generate summaries of fetched books.
- Captures book images using Apple's camera API and generates summaries.
- Follows the MVVM architecture pattern for clean code separation.
- Includes test cases to validate response fetching.

## Technologies Used

- SwiftUI: Used for building the user interface.
- Google's Generative AI: Utilized for generating book summaries.
- Google's Book API: Used for fetching book details.
- Apple's Camera API: Utilized for capturing book images.

## Folder Structure
```
GoogleGeminiSampleApp
│
├── Models
│ ├── Book.swift
│ ├── TextToSpeechModel.swift
│ └── GenerateAIModel.swift
│
├── Views
│ ├── BookView
|       └── BookView.swift
│ ├── CaptureBookView
|        └── CaptureBookView.swift
│ └── HomeView.swift
| └── EmptyView.swift
│
├── ViewModels
│ ├── BookListViewModel.swift
│ ├── CaptureBookViewModel.swift
│ └── BookSummaryViewModel.swift
│
├── Constants
│ ├── Constants.swift
│ └── ...
│
└── Tests
├── GoogleGeminiSampleAppTests.swift
```

## How to Use

1. Clone this repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## Contributions

Contributions are welcome! Feel free to fork this repository, make changes, and submit a pull request.
