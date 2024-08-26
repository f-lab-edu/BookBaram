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

    private let memoryCache = NSCache<NSString, ImageInfo>()
    private let diskCache = ImageDiskCache()
    private let countLimit: Int = 100

    private init() {
        memoryCache.countLimit = countLimit
    }

    func loadImage(imageUrl url: URL) async -> UIImage? {
        print(url.absoluteString)
        guard let splitUrl = url.absoluteString.split(separator: "/").last else { return nil }
        let key = String(splitUrl)

        if let memoryImage = await loadMemoryCache(key: key) {
            return memoryImage
        }

        if let diskImage = await loadDiskCache(key: key) {
            return diskImage
        }

        return await downloadImage(imageUrl: url.absoluteString, key: key)
    }

    private func cacheImage(imageInfo: ImageInfo, key: String) -> UIImage? {
        if let image = UIImage(data: imageInfo.data) {
            memoryCache.setObject(imageInfo, forKey: key as NSString)
            return image
        }

        return nil
    }

    private func loadMemoryCache(key: String) async -> UIImage? {
        guard let memoryResult = memoryCache.object(forKey: key as NSString) else { return nil }
        if let expireDate = memoryResult.expireTime,
           !isValidExpireTime(date: expireDate) {
            return await downloadImage(imageUrl: memoryResult.url.absoluteString, key: key)
        }

        return UIImage(data: memoryResult.data)
    }

    private func loadDiskCache(key: String) async -> UIImage? {
        do {
            guard let diskResult = try diskCache.loadImage(imageUrl: key) else { return nil }
            if let expireDate = diskResult.expireTime,
               !isValidExpireTime(date: expireDate) {
                return await downloadImage(imageUrl: diskResult.url.absoluteString, key: key)
            }

            return cacheImage(imageInfo: diskResult, key: key)
        } catch {
            return nil
        }
    }

    private func isValidExpireTime(date: Date) -> Bool {
        let now = Date.now
        if date > now {
            return true
        }

        return false
    }

    private func downloadImage(imageUrl: String, key: String) async -> UIImage? {
        if let imageInfo = await downloadImageInfo(imageUrl: imageUrl, key: key),
           let image = UIImage(data: imageInfo.data) {
            memoryCache.setObject(imageInfo, forKey: imageUrl as NSString)
            return image
        }

        return nil
    }

    private func downloadImageInfo(imageUrl: String, key: String) async -> ImageInfo? {
        do {
            guard let imageInfo = try await ImageDownloader.shared.downloadImage(imageUrl: imageUrl) else { return nil }
            try diskCache.saveImage(key: key, imageInfo: imageInfo)

            return imageInfo
        } catch {
            return nil
        }
    }
}
