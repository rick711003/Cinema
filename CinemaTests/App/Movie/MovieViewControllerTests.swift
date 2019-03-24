//
//  MovieViewControllerTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class MovieViewControllerTests: XCTestCase {
    
    private var viewController: MovieViewController!
    private var presenter: MockMovieViewOutput!
    
    override func setUp() {
        super.setUp()
        presenter = MockMovieViewOutput()
        viewController = MovieViewController(
            nibName: String(describing: MovieViewController.self),
            bundle: Bundle(for: MovieViewController.self)
        )
        viewController.loadView()
        viewController.output = presenter
    }
    
    override func tearDown() {
        presenter = nil
        viewController = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        // when
        viewController.viewDidLoad()
        
        // then
        XCTAssertTrue(presenter.viewIsReadyCalled)
    }
    
    func testViewWillAppear() {
        // when
        viewController.viewWillAppear(true)
        
        // then
        XCTAssertTrue(presenter.viewWillAppearCalled)
    }
    
    func testDidTapBookNow() {
        // when
        viewController.tapBookNow(UIButton())
        
        // then
        XCTAssertTrue(presenter.didTopBookNowCalled)
    }
    
    func testUpdateNavigationTitle() {
        // when
        viewController.updateNavigationTitle(with: "title")
        
        // then
        XCTAssertEqual(viewController.title, "title")
    }
    
    func testMovieReloadDataHasData() {
        // given
        let mockMovieObject = MockMovie()
        var movieModel = MovieViewModel(movieId: 328111, movieName: "The Secret Life of Pets")
        movieModel.movie = mockMovieObject.movie
        viewController.viewDidLoad()
        viewController.activityIndicator.startAnimating()
        
        // when
        viewController.movieReloadData(viewModel: movieModel)
        
        // then
        XCTAssertFalse(viewController.activityIndicator.isAnimating)
        XCTAssertTrue(viewController.tableView.visibleCells.count == 5)
    }
    
    func testMovieReloadDataNoData() {
        // given
        let movieModel = MovieViewModel(movieId: 328111, movieName: "The Secret Life of Pets")
        viewController.activityIndicator.startAnimating()
        
        // when
        viewController.movieReloadData(viewModel: movieModel)
        
        // then
        XCTAssertTrue(viewController.tableView.visibleCells.count == 0)
    }
    
    func testAlertErrorMessage() {
        // given
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
        // when
        viewController.alertErrorMessage("alert message")
        
        //then
        XCTAssertTrue(viewController.presentedViewController is UIAlertController)
    }
}
