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
        viewController.viewDidLoad()
        
        // then
        XCTAssertTrue(presenter.viewIsReadyCalled)
    }
    
    func testDidTapBookNow() {
        // when
        viewController.tapBookNow(UIButton())
        
        // then
        XCTAssertTrue(presenter.didTopBookNowCalled)
    }
}
