//
//  HorizontalCircleListViewTests.swift
//  
//
//  Created by Tuan Hoang Anh on 12/10/24.
//

import SnapshotTesting
import XCTest
import Nuke

@testable import CommonUI

struct ImageHolderImp: ImageHolder {
    let id: Int
    let imageURL: URL?
}

final class HorizontalCircleListViewTests: XCTestCase {

    func testHorizontalCircleListView() {
        // Fetch the image and store into the Cache first
        let imageURL1 = Bundle.module.url(forResource: "izuzUb0sDokqp9o8utVfsrSJuy5", withExtension: "png")!
        let imageURL2 = Bundle.module.url(forResource: "kKgQzkUCnQmeTPkyIwHly2t6ZFI", withExtension: "png")!
        let image1 = UIImage(contentsOfFile: imageURL1.path())
        let image2 = UIImage(contentsOfFile: imageURL2.path())
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL1))] = ImageContainer(image: image1!)
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL2))] = ImageContainer(image: image2!)
        
        let view = HorizontalCircleListView(
            objects: [
                ImageHolderImp(
                    id: 1,
                    imageURL: imageURL1
                ),
                ImageHolderImp(
                    id: 2,
                    imageURL: imageURL2
                )
            ],
            onSelect: {
                _ in
            }
        )
        
        assertSnapshot(
            of: view,
            as: .image(perceptualPrecision: 0.98, layout: .device(config: .iPhone13ProMax))
        )
    }
    
}
