//
//  MoviePresenterTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class MoviePresenterTests: XCTestCase {
    
    private var presenter: MoviePresenter!
    private var view: MockMovieViewInput!
    private var interactor: MockMovieInteractorInput!
    private var router: MockMovieRouterInput!
    private var viewModel: MovieViewModel!
    private let mockMovie = MockMovie()
    
    override func setUp() {
        super.setUp()
        view = MockMovieViewInput()
        interactor = MockMovieInteractorInput()
        router = MockMovieRouterInput()
        viewModel = MovieViewModel(movieId: 123, movieName: "movie name")
        presenter = MoviePresenter(with: viewModel)
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    }
    
    override func tearDown() {
        view = nil
        interactor = nil
        router = nil
        presenter = nil
        super.tearDown()
    }
    
    func testDidReceiveMovieData() {
        // when
        presenter.didReceiveMovieData(movie: mockMovie.movie!)
        
        // then
        XCTAssertEqual(view.mockMovieViewModel?.movie!.movieId, mockMovie.movie?.movieId!)
        XCTAssertTrue(view.movieReloadDataCalled)
    }
    
    func testViewIsReady() {
        // when
        presenter.viewIsReady()
        
        // then
        XCTAssertEqual(interactor.mockMovieId, 123)
        XCTAssertTrue(interactor.requestMovieCalled)
    }
    
    func testViewWillAppear() {
        // when
        presenter.viewWillAppear()
        
        // then
        XCTAssertEqual(view.mockNavigationTitle, viewModel.movieName)
        XCTAssertTrue(view.updateNavigationTitleCalled)
    }
    
    func testDidTapBookNow() {
        // when
        presenter.didTapBookNow()
        
        // then
        XCTAssertTrue(router.gotoWebViewCalled)
    }
    
    func testGotError() {
        // given
        let error: Error = NSError(domain: "error description", code: 999, userInfo: nil)
        // when
        presenter.gotError(with: error)
        
        // then
        XCTAssertTrue(view.alertErrorMessageCalled)
        XCTAssertEqual(view.alertMessage, error.localizedDescription)
    }
}
