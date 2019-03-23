//
//  DiscoverInteractorTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverInteractorTests: XCTestCase {
    private var interactor: DiscoverInteractor!
    private var mockTMDBService: MockTMDBService!
    
    override func setUp() {
        super.setUp()
        mockTMDBService = MockTMDBService()
        interactor = DiscoverInteractor(with: mockTMDBService)
    }
    
    override func tearDown() {
        mockTMDBService = nil
        interactor = nil
        super.tearDown()
    }
    
    func testRequestDiscover() {
        // given
        let page = 123
        
        // when
        interactor.requestDiscover(page: page)
        
        // then
        XCTAssertEqual(mockTMDBService.discoverCurrentPage, page)
        XCTAssertTrue(mockTMDBService.getDiscoverServiceCalled)
    }
}
