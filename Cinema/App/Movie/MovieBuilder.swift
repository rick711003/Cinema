//
//  MovieBuilder.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

public struct MovieBuilder {
    
    public init() {}
    
    public func  build(with model: MovieViewModel, service: TMDBService) -> MovieViewController {
        
        let nibName = String(describing: MovieViewController.self)
        let viewController = MovieViewController(nibName: nibName, bundle: nil)
        
        let router = MovieRouter()
        router.viewController = viewController
        
        let presenter = MoviePresenter(with: model)
        presenter.view = viewController
        presenter.router = router
        
        let interactor = MovieInteractor(with: service)
        interactor.output = presenter
        presenter.interactor = interactor
        
        viewController.output = presenter
        return viewController
    }
}
