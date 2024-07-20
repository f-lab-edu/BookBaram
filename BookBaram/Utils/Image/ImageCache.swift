//
//  ImageCache.swift
//  BookBaram
//
//  Created by 이송미 on 7/20/24.
//

import Foundation
import SwiftUI

final class ImageCache {
    public static let shared = ImageCache()

    private let memoryCache = NSCache<NSString, UIImage>()

    private init() { }

    func loadImage(imageUrl key: String) async -> UIImage? {
        if let result = memoryCache.object(forKey: key as NSString) {
            return result
        }

        return await downloadImage(imageUrl: key)
    }

    private func downloadImage(imageUrl: String) async -> UIImage? {
        if let imgData = try? await ImageDownloader.shared.downloadImage(imageUrl: imageUrl),
           let image = UIImage(data: imgData) {
            memoryCache.setObject(image, forKey: imageUrl as NSString)
            return image
        }

        return nil
    }
}
