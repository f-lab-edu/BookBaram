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

    func loadImage(imageUrl key: String) throws -> Data? {
        guard let cachePath else { return nil }

        let filePath = URL(filePath: cachePath).appending(path: key)

        if !fileManager.fileExists(atPath: filePath.path()) {
            return nil
        }

        return try Data(contentsOf: filePath)
    }

    func saveImage(imageUrl key: String, image data: Data) {
        guard let cachePath else { return }

        let filePath = URL(filePath: cachePath).appending(path: key)

        _ = fileManager.createFile(atPath: filePath.path(), contents: data)
    }
}
