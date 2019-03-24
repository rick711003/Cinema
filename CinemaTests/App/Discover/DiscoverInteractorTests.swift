//
//  DiscoverInteractorTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class DiscoverInteractorTests: XCTestCase {
    private var interactor: DiscoverInteractor!
    private var mockTMDBService: MockTMDBService!
    private var ouptput: MockDiscoverInteractorOutput!
    override func setUp() {
        super.setUp()
        ouptput = MockDiscoverInteractorOutput()
        mockTMDBService = MockTMDBService()
        interactor = DiscoverInteractor(with: mockTMDBService)
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
        let page = 123
        mockTMDBService.mockDiscover = MockDicover().dicover
        
        // when
        interactor.requestDiscover(page: page)
        
        // then
        XCTAssertEqual(mockTMDBService.discoverCurrentPage, page)
        XCTAssertTrue(mockTMDBService.getDiscoverServiceCalled)
        XCTAssertTrue(ouptput.didReceiveDiscoverDataCalled)
    }
    
    func testRequestDicoverError() {
        // given
        let page = 123
        let error: Error = NSError(domain: "error description", code: 999, userInfo: nil)
        mockTMDBService.error = error
        
        // when
        interactor.requestDiscover(page: page)
        
        // then
        XCTAssertTrue(ouptput.gotErrorCalled)
        XCTAssertEqual(ouptput.mockError.localizedDescription, error.localizedDescription)
    }
}
