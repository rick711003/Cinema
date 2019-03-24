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
    private var ouptput: MockMovieInteractorOutput!
    override func setUp() {
        super.setUp()
        ouptput = MockMovieInteractorOutput()
        mockTMDBService = MockTMDBService()
        interactor = MovieInteractor(with: mockTMDBService)
        interactor.output = ouptput
    }
    
    override func tearDown() {
        mockTMDBService = nil
        interactor = nil
        ouptput = nil
        super.tearDown()
    }
    
    func testRequestDiscover() {
        // given
        let movieId = 123
        mockTMDBService.mockMovie = MockMovie().movie
        
        // when
        interactor.requestMovie(movieId: movieId)
        
        // then
        XCTAssertEqual(mockTMDBService.currentMovieId, movieId)
        XCTAssertTrue(mockTMDBService.getMovieServiceCalled)
        XCTAssertTrue(ouptput.didReceiveMovieDataCalled)
    }
    
    func testRequestDicoverError() {
        // given
        let movieId = 123
        let error: Error = NSError(domain: "error description", code: 999, userInfo: nil)
        mockTMDBService.error = error
        
        // when
        interactor.requestMovie(movieId: movieId)
        
        // then
        XCTAssertTrue(ouptput.gotErrorCalled)
        XCTAssertEqual(ouptput.mockError.localizedDescription, error.localizedDescription)
    }
}
