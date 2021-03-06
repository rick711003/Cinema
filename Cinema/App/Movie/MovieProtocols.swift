//
//  MovieProtocols.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

// MARK: - View Input & Output

protocol MovieViewInput: class {
    func updateNavigationTitle(with navigationTitle: String)
    func movieReloadData(viewModel: MovieViewModel)
    func alertErrorMessage(_ message: String)
}

protocol MovieViewOutput {
    func viewIsReady()
    func viewWillAppear()
    func didTapBookNow()
}

// MARK: - Interactor Input & Output

protocol MovieInteractorInput {
    func requestMovie(movieId: Int)
}

protocol MovieInteractorOutput: class {
    func didReceiveMovieData(movie: Movie)
    func gotError(with error: Error)
}

// MARK: - Router Input

protocol MovieRouterInput {
    func gotoWebView()
}
