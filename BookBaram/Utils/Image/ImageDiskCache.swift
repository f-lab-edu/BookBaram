//
//  ImageDiskCache.swift
//  BookBaram
//
//  Created by 이송미 on 7/20/24.
//

import Foundation

final class ImageDiskCache {
    private let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    private let fileManager = FileManager()

    func loadImage(imageUrl key: String) throws -> ImageInfo? {
        guard let cachePath else { return nil }

        let filePath = URL(filePath: cachePath).appending(path: key)

        if !fileManager.fileExists(atPath: filePath.path()) {
            return nil
        }

        let data = try Data(contentsOf: filePath)
        return try JSONDecoder().decode(ImageInfo.self, from: data)
    }

    func saveImage(key: String, imageInfo: ImageInfo) throws {
        guard let cachePath else { return }

        print("!!!!! imageInfo: \(imageInfo)")
        let filePath = URL(filePath: cachePath).appending(path: key)

        let data = try JSONEncoder().encode(imageInfo)
        let saved = fileManager.createFile(atPath: filePath.path(), contents: data)
        print("!!!!! saved: \(saved)")
    }
}
