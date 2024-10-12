//
//  SectionHeaderViewTests.swift
//  
//
//  Created by Tuan Hoang Anh on 12/10/24.
//

import SnapshotTesting
import XCTest
@testable import CommonUI

final class SectionHeaderViewTests: XCTestCase {
    
    func testSectionHeaderView() {
        let view = SectionHeaderView(
            title: "Top trending",
            showArrowButton: true) {
                
            }
        
        assertSnapshot(
            of: view,
            as: .image(perceptualPrecision: 0.98, layout: .device(config: .iPhone13ProMax))
        )
    }
    
}
