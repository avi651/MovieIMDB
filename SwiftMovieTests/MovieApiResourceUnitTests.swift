//
//  MovieApiResourceUnitTests.swift
//  SwiftMovieTests
//
//  Created by Avinash Kumar on 31/07/23.
//

import XCTest
import Foundation
@testable import SwiftMovie


final class MovieApiResourceUnitTests: XCTestCase {
    
    func test_MovieApiResource_With_ValidRequest_Returns_Response(){
        // ARRANGE
        let expectation = self.expectation(description: "ValidRequest_Returns_MoviesResponse")
        
        let handler = APIService()
        
        handler.fetchMovie { (result) in
            XCTAssertNotNil(result)
            let _ = result.map { value in
                XCTAssertEqual(298618, value.results.first?.id)
                XCTAssertEqual("The Flash", value.results.first?.title)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func test_MovieApiResource_With_ValidRequest_Returns_NotEqualResponse(){
        // ARRANGE
        let expectation = self.expectation(description: "ValidRequest_Returns_NotEqualResponse")
        
        let handler = APIService()
        
        handler.fetchMovie { (result) in
            XCTAssertNotNil(result)
            let _ = result.map { value in
                XCTAssertNotEqual(2323, value.results.first?.id)
                XCTAssertNotEqual("Error Movie", value.results.first?.title)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}
