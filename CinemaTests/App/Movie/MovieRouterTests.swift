//
//  MovieRouterTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class MovieRouterTests: XCTestCase {
    
    private var router: MovieRouter!
    private var mockNavigationController: MockNavigationController!
    
    override func setUp() {
        super.setUp()
        let mockViewController = UIViewController()
        mockNavigationController = MockNavigationController(rootViewController: mockViewController)
        router = MovieRouter()
        router.viewController = mockNavigationController.topViewController
    }
    
    override func tearDown() {
        mockNavigationController = nil
        router = nil
        super.tearDown()
    }
    
    func testGotoMovieDetail() {
        // when
        router.gotoWebView()
        
        // then
        XCTAssertTrue(mockNavigationController.pushCalled)
        XCTAssertTrue(mockNavigationController.pushedViewController is WebViewController)
    }
}
