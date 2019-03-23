//
//  DiscoverRouterTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverRouterTests: XCTestCase {
    
    private var router: DiscoverRouter!
    private var mockNavigationController: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        let mockViewController = UIViewController()
        mockNavigationController = MockNavigationController(rootViewController: mockViewController)
        router = DiscoverRouter()
        router.viewController = mockNavigationController.topViewController
    }
    
    override func tearDown() {
        mockNavigationController = nil
        router = nil
        super.tearDown()
    }
    
    func testGotoMovieDetail() {
        // given
        let movideId: Int = 328111
        let movieName: String = "The Secret Life of Pets"
        
        // when
        router.gotoMovieDetail(movideId: movideId, movieName: movieName)

        // then
        XCTAssertTrue(mockNavigationController.pushCalled)
        XCTAssertTrue(mockNavigationController.pushedViewController is MovieViewController)
    }
}
