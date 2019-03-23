//
//  MovieBuilderTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class MovieBuilderTests: XCTestCase {
    
    private var builder: MovieBuilder!
    
    override func setUp() {
        super.setUp()
        builder = MovieBuilder()
    }
    
    override func tearDown() {
        builder = nil
        super.tearDown()
    }
    
    func testBuildForDiscover() {
        // given
        let movieViewModel = MovieViewModel(movieId: 123, movieName: "movie name")
        let service = TMDBService()
        // when
        let discoverViewController = builder.build(with: movieViewModel, service: service)
        
        // then
        XCTAssertTrue(discoverViewController.output is MoviePresenter)
    }
}
