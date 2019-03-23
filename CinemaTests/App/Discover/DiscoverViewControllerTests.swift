//
//  DiscoverViewControllerTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverViewControllerTests: XCTestCase {
    
    private var presenter: MockDiscoverViewOutput!
    private var viewController: DiscoverViewController!
    
    override func setUp() {
        super.setUp()
        presenter = MockDiscoverViewOutput()
        viewController = DiscoverViewController(
            nibName: String(describing: DiscoverViewController.self),
            bundle: Bundle(for: DiscoverViewController.self)
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
    
    func testRefreshDiscoverData() {
        // when
        viewController.refreshDiscoverData(UIRefreshControl())
        
        // then
        XCTAssertTrue(presenter.refreshDiscoverDataCalled)
    }
}
