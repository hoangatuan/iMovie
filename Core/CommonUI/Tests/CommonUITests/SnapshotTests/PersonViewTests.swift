//
//  PersonViewTests.swift
//  
//
//  Created by Tuan Hoang Anh on 12/10/24.
//

import XCTest
import Nuke
import SwiftUI
import SnapshotTesting
@testable import CommonUI

final class PersonViewTests: XCTestCase {
    
    func testPersonView() {
        let imageURL = Bundle.module.url(forResource: "5qHNjhtjMD4YWH3UP0rm4tKwxCL", withExtension: "png")!
        let image = UIImage(contentsOfFile: imageURL.path())
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL))] = ImageContainer(image: image!)
        
        let view = PersonView(
            person: .init(
                adult: false,
                gender: .male,
                id: 1,
                department: "Actor",
                name: "Robert Downey Jr.",
                originalName: "Robert Downey Jr.",
                popularity: 64.018,
                profilePath: imageURL,
                knownFor: []
            )
        ).screenBackground(with: .color040F23)
        
        assertSnapshot(
            of: view,
            as: .image(perceptualPrecision: 0.98, layout: .device(config: .iPhone13ProMax))
        )
    }

}
