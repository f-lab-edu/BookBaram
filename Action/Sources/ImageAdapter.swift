//
//  File.swift
//  
//
//  Created by 이송미 on 9/9/24.
//

import Foundation
import UIKit
import BookBaramUtils

public protocol ImageProtocol {
    func loadImage(url: URL) async -> UIImage?
}

public struct ImageAdapter: ImageProtocol {
    public static let shared = ImageAdapter()
    private let imageLoader = ImageCache.shared

    public func loadImage(url: URL) async -> UIImage? {
        await imageLoader.loadImage(imageUrl: url)
    }
}
