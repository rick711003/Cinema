//
//  DiscoverBuilderTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverBuilderTests: XCTestCase {
    
    private var builder: DiscoverBuilder!
    
    override func setUp() {
        super.setUp()
        builder = DiscoverBuilder()
    }
    
    override func tearDown() {
        builder = nil
        super.tearDown()
    }
    
    func testBuildForDiscover() {
        // given
        let discoverViewModel = DiscoverViewModel()
        let service = TMDBService()
        // when
        let discoverViewController = builder.build(with: discoverViewModel, service: service)
        
        // then
        XCTAssertTrue(discoverViewController.output is DiscoverPresenter)
    }
}
