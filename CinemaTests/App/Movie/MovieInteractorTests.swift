//
//  MovieInteractorTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class MovieInteractorTests: XCTestCase {
    private var interactor: MovieInteractor!
    private var mockTMDBService: MockTMDBService!
    
    override func setUp() {
        super.setUp()
        mockTMDBService = MockTMDBService()
        interactor = MovieInteractor(with: mockTMDBService)
    }
    
    override func tearDown() {
        mockTMDBService = nil
        interactor = nil
        super.tearDown()
    }
    
    func testRequestDiscover() {
        // given
        let movieId = 123
        
        // when
        interactor.requestMovie(movieId: movieId)
        
        // then
        XCTAssertEqual(mockTMDBService.currentMovieId, movieId)
        XCTAssertTrue(mockTMDBService.getMovieServiceCalled)
    }
}
