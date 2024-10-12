//
//  CreditImagesSectionViewTests.swift
//  
//
//  Created by Tuan Hoang Anh on 10/10/24.
//

import SnapshotTesting
import Domain
import XCTest
import SwiftUI
import CommonUI
import Nuke

@testable import People

final class CreditImagesSectionViewTests: XCTestCase {
    func testCreditImagesSectionView() {
        
        // Fetch the image and store into the Cache first
        let imageURL1 = Bundle.module.url(forResource: "82rxrGxOqQW2NjKsIiNbDYHFfmb", withExtension: "png")!
        let imageURL2 = Bundle.module.url(forResource: "baeHNv3qrVsnApuKbZXiJOhqMnw", withExtension: "png")!
        let image1 = UIImage(contentsOfFile: imageURL1.path())
        let image2 = UIImage(contentsOfFile: imageURL2.path())
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL1))] = ImageContainer(image: image1!)
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL2))] = ImageContainer(image: image2!)
        
        let view = CreditImagesSectionView(
            images: [
                .init(
                    aspectRatio: 0.667,
                    height: 900,
                    width: 600,
                    filePath: imageURL1
                ),
                .init(
                    aspectRatio: 0.667,
                    height: 2400,
                    width: 1600,
                    filePath: imageURL2
                )
            ]
        )
        
        assertSnapshot(
            of: view,
            as: .image(perceptualPrecision: 0.98, layout: .device(config: .iPhone13ProMax))
        )
    }
}
