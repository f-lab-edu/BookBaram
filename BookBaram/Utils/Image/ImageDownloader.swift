//
//  ImageDownloader.swift
//  BookBaram
//
//  Created by 이송미 on 7/20/24.
//

import Foundation

final class ImageDownloader {
    static let shared = ImageDownloader()

    private init() {}

    func downloadImage(imageUrl: String) async throws -> Data? {
        if let url = URL(string: imageUrl) {
            let (imageData, _) = try await URLSession.shared.data(from: url)
            return imageData
        }

        return nil
    }
}
