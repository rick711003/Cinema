//
//  DiscoverPresenterTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverPresenterTests: XCTestCase {
    
    private var presenter: DiscoverPresenter!
    private var view: MockDiscoverViewInput!
    private var interactor: MockDiscoverInteractorInput!
    private var router: MockDiscoverRouterInput!
    private var viewModel: DiscoverViewModel!
    private let mockDicover = MockDicover()
    override func setUp() {
        super.setUp()
        view = MockDiscoverViewInput()
        interactor = MockDiscoverInteractorInput()
        router = MockDiscoverRouterInput()
        viewModel = DiscoverViewModel(discoverResponse: mockDicover.dicover,
                                      currentPage: 1,
                                      dataSource: mockDicover.dicover?.results)
        presenter = DiscoverPresenter(with: DiscoverViewModel())
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
    
    func testViewWillAppear() {
        // when
        presenter.viewWillAppear()
        
        // then
        XCTAssertEqual(view.mockNavigationTitle, viewModel.navigationTitle)
        XCTAssertTrue(view.updateNavigationTitleCalled)
    }
    
    func testViewIsReady() {
        // when
        presenter.viewIsReady()
        
        // then
        XCTAssertEqual(interactor.requestionPage, 1)
        XCTAssertTrue(interactor.requestDiscoverCalled)
    }
    
    func testRefreshDiscoverData() {
        // when
        presenter.refreshDiscoverData()
        
        // then
        XCTAssertEqual(interactor.requestionPage, 1)
        XCTAssertTrue(interactor.requestDiscoverCalled)
    }
    
    func testLoadNextPage() {
        // when
        presenter.loadNextPage()
        
        // then
        XCTAssertEqual(interactor.requestionPage, 2)
        XCTAssertTrue(interactor.requestDiscoverCalled)
    }
    
    func testDidReceiveDiscoverData() {
        // when
        presenter.didReceiveDiscoverData(discover: mockDicover.dicover!)
        
        // then
        XCTAssertNotNil(view.mockDiscoverViewModel?.dataSource)
        XCTAssertTrue(view.discoverReloadDataCalled)
    }
}
