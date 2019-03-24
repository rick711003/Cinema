//
//  WebViewControllerTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 24/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
@testable import Cinema

final class WebViewControllerTests: XCTestCase {
    private var webViewController: WebViewController!
    
    override func setUp() {
        super.setUp()
        webViewController = WebViewController()
    }
    
    override func tearDown() {
        webViewController = nil
        super.tearDown()
    }
    
    func testWebViewController() {
        // given
        webViewController.loadView()
        
        // when
        webViewController.viewDidLoad()
        
        // then
        XCTAssertEqual(webViewController.webView.url?.absoluteString, Constants.webViewURL)
        XCTAssertEqual(webViewController.title, Constants.bookNow)
    }
}
