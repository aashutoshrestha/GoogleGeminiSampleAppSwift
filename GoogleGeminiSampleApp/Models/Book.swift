//
//  BookModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation

// MARK: - GoogleBooksResponse
class GoogleBooksResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
class Item: Codable , Hashable{
    // Differentiating
        static func == (lhs: Item, rhs: Item) -> Bool {
            lhs.id == rhs.id
        }

        // Hashing
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
    let kind: String?
    let id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
class AccessInfo: Codable {
    let country: String?
    let viewability: String?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub: Epub?
    let pdf: PDF?
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

// MARK: - Epub
class Epub:Codable {
    let isAvailable: Bool?
}

// MARK: - PDF
class PDF: Codable {
    let isAvailable: Bool?
    let acsTokenLink: String?
}
// MARK: - SaleInfo
class SaleInfo: Codable {
    let country: String?
    let saleability: String?
    let isEbook: Bool?
}

// MARK: - SearchInfo
class SearchInfo: Codable {
    let textSnippet: String?
}

// MARK: - VolumeInfo
class VolumeInfo: Codable {
    let title: String?
    let subtitle: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate, description: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink, infoLink: String?
    let canonicalVolumeLink: String?
}

// MARK: - ImageLinks
class ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
class IndustryIdentifier: Codable {
    let type: String?
    let identifier: String?
}

// MARK: - PanelizationSummary
class PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool?
}

// MARK: - ReadingModes
class ReadingModes: Codable {
    let text, image: Bool?
}

