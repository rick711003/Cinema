//
//  MovieRouter.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

final class MovieRouter {
    weak var viewController: UIViewController?
}

// MARK: - MovieRouterInput
extension MovieRouter: MovieRouterInput {
    func gotoWebView() {
        let webViewCtrl = WebViewController()
        viewController?.navigationController?.pushViewController(webViewCtrl, animated: true)
    }
}
