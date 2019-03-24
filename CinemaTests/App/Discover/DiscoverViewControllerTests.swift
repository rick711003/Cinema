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
        viewController.viewWillAppear(true)
        
        // then
        XCTAssertTrue(presenter.viewWillAppearCalled)
    }
    
    func testRefreshDiscoverData() {
        // when
        viewController.refreshDiscoverData(UIRefreshControl())
        
        // then
        XCTAssertTrue(presenter.refreshDiscoverDataCalled)
    }
    
    func testUpdateNavigationTitle() {
        // when
        viewController.updateNavigationTitle(with: "title")
        
        // then
        XCTAssertEqual(viewController.title, "title")
    }
    
    func testDiscoverReloadDataUseRefreshControl() {
        // given
        let expectation = self.expectation(description: "stop refreshControl failing ")
        let mockDicover = MockDicover()
        let discoverViewModel = DiscoverViewModel(discoverResponse: mockDicover.dicover,
                                                  currentPage: 1,
                                                  dataSource: mockDicover.dicover?.results)
        viewController.viewDidLoad()
        guard let refreshControl = viewController.tableView.refreshControl else {
            XCTFail()
            return 
        }
        refreshControl.beginRefreshing()
        
        // when
        viewController.discoverReloadData(viewModel: discoverViewModel)
        
        // given
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            XCTAssertFalse(refreshControl.isRefreshing)
            expectation.fulfill()
        }
       
        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testDiscoverReloadData() {
        // given
        let mockDicover = MockDicover()
        let discoverViewModel = DiscoverViewModel(discoverResponse: mockDicover.dicover,
                                                  currentPage: 1,
                                                  dataSource: mockDicover.dicover?.results)
        viewController.activityIndicator.startAnimating()
        
        // when
        viewController.discoverReloadData(viewModel: discoverViewModel)
        
        // given
        XCTAssertFalse(viewController.activityIndicator.isAnimating)
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
