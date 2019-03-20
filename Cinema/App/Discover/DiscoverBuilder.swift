//
//  DiscoverControllerBuilder.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

public struct DiscoverBuilder {
    
    public init() {}
    
    public func build() -> DiscoverViewController {
        
        let nibName = String(describing: DiscoverViewController.self)
        let viewController = DiscoverViewController(nibName: nibName, bundle: nil)
        
        let router = DiscoverRouter()
        router.viewController = viewController
        
        let presenter = DiscoverPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = DiscoverInteractor()
        interactor.output = presenter
        
        viewController.output = presenter
        return viewController
    }
}

