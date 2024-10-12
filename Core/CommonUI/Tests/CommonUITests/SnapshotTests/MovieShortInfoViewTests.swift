//
//  MovieShortInfoViewTests.swift
//  
//
//  Created by Tuan Hoang Anh on 12/10/24.
//

import XCTest
import Nuke
import SwiftUI
import SnapshotTesting
@testable import CommonUI

final class MovieShortInfoViewTests: XCTestCase {

    func testMovieShortInfoView() {
        let imageURL = Bundle.module.url(forResource: "izuzUb0sDokqp9o8utVfsrSJuy5", withExtension: "png")!
        let image = UIImage(contentsOfFile: imageURL.path())
        Nuke.ImageCache.shared[ImageCacheKey(request: ImageRequest(url: imageURL))] = ImageContainer(image: image!)
        
        let view = MovieShortInfoView(
            shortInfo: .init(
                posterPath: imageURL,
                title: "The Platform 2",
                voteAverage: 8.0
            )
        ).screenBackground(with: .color040F23)
        
        assertSnapshot(
            of: view,
            as: .image(perceptualPrecision: 0.98, layout: .device(config: .iPhone13ProMax))
        )
    }
}
