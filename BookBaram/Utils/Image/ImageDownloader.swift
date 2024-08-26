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

    func downloadImage(imageUrl: String) async throws -> ImageInfo? {
        if let url = URL(string: imageUrl) {
            let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
            let (imageData, response) = try await URLSession.shared.data(for: urlRequest)
            let expireTime = extractExpireTime(response: response)

            return ImageInfo(url: url, data: imageData, expireTime: expireTime)
        }

        return nil
    }

    private func extractExpireTime(response: URLResponse) -> String? {
        if let httpUrlResponse = response as? HTTPURLResponse {
            return httpUrlResponse.value(forHTTPHeaderField: "Expires")
        }

        return nil
    }
}
