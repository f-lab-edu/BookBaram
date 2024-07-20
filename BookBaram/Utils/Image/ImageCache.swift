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

    func loadImage(imageUrl key: String) async -> UIImage? {
        if let memoryResult = memoryCache.object(forKey: key as NSString) {
            return memoryResult
        }

        if let diskResult = try? diskCache.loadImage(imageUrl: key) {
            return UIImage(data: diskResult)
        }

        return await downloadImage(imageUrl: key)
    }

    private func downloadImage(imageUrl: String) async -> UIImage? {
        if let imgData = try? await ImageDownloader.shared.downloadImage(imageUrl: imageUrl),
           let image = UIImage(data: imgData) {
            memoryCache.setObject(image, forKey: imageUrl as NSString)
            diskCache.saveImage(imageUrl: imageUrl, image: imgData)
            return image
        }

        return nil
    }
}
