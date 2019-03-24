//
//  WebViewController.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 21/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.bookNow
        navigationItem.backBarButtonItem = UIBarButtonItem()
        let myURL = URL(string: Constants.webViewURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
