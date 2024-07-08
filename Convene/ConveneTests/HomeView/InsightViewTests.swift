//
//  InsightViewTests.swift
//  ConveneTests
//
//  Created by Sukhaman Singh on 7/4/24.
//

import Foundation
import ViewInspector
@testable import Convene
import XCTest

class InsightViewTests: XCTestCase {
    
    func test_homeView_hasTitleText() throws {
        // Given
        let view = InsightView()
        
        // When
        let titleText = try view.inspect().find(text: "Trending Events")
        
        // Then
        XCTAssertEqual(try titleText.string(), "Trending Events")
    }
}
