//
//  DiscoverRouter.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

final class DiscoverRouter {
    
    weak var viewController: UIViewController?
}

// MARK: - DiscoverRouterInput
extension DiscoverRouter: DiscoverRouterInput {
    
    func gotoMovieDetail(movideId: Int, movieName: String) {
        let movieViewModel = MovieViewModel(movieId: movideId, movieName: movieName)
        let movieBuilder = MovieBuilder()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let movieViewController = movieBuilder.build(with: movieViewModel, service: appDelegate.service ?? TMDBService())
        
        guard let navigationController = viewController?.navigationController else {
            return
        }
        navigationController.pushViewController(movieViewController, animated: true)
    }
}
