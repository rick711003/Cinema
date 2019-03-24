//
//  TMDBServiceTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema


final class TMDBServiceTests: XCTestCase {
    
    var service: TMDBService!
    override func setUp() {
        super.setUp()
        service = TMDBService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testGetDiscover() {
        let expectation = self.expectation(description: "Get data failing")
        service.getDiscover(page: 1) { (discover, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(discover)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testGetMovie() {
        let expectation = self.expectation(description: "Get data failing")
        service.getMovie(movieId: 328111) { (movie, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(movie)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
