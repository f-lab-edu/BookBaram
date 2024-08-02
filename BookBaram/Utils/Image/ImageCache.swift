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
    private let diskCache = ImageDiskCache()

    private init() { }

    func loadImage(imageUrl url: URL) async -> UIImage? {
        guard let splitUrl = url.absoluteString.split(separator: "/").last else { return nil }
        let key = String(splitUrl)

        if let memoryResult = memoryCache.object(forKey: key as NSString) {
            return memoryResult
        }

        if let diskResult = try? diskCache.loadImage(imageUrl: key) {
            let image = cacheImage(data: diskResult, key: key)
            return image
        }

        return await downloadImage(imageUrl: url.absoluteString, key: key)
    }

    private func cacheImage(data: Data, key: String) -> UIImage? {
        if let image = UIImage(data: data) {
            memoryCache.setObject(image, forKey: key as NSString)
            return image
        }

        return nil
    }

    private func downloadImage(imageUrl: String, key: String) async -> UIImage? {
        if let imgData = try? await ImageDownloader.shared.downloadImage(imageUrl: imageUrl),
           let image = UIImage(data: imgData) {
            memoryCache.setObject(image, forKey: imageUrl as NSString)
            diskCache.saveImage(key: key, image: imgData)
            return image
        }

        return nil
    }
}
