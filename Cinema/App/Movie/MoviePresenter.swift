//
//  MoviePresenter.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

final class MoviePresenter {
    weak var view: MovieViewInput?
    var interactor: MovieInteractorInput?
    var router: MovieRouterInput?
    
    private var viewModel: MovieViewModel
    
    init(with model: MovieViewModel) {
        self.viewModel = model
    }
}

private extension MoviePresenter {
    
    func loadData() {
        guard let interactor = interactor else {
            return
        }
        interactor.requestMovie(movieId: viewModel.movieId)
    }
}

// MARK: - MovieInteractorOutput
extension MoviePresenter: MovieInteractorOutput {
    func didReceiveMovieData(movie: Movie) {
        self.viewModel.movie = movie
        view?.movieReloadData(viewModel: viewModel)
    }
}

// MARK: - MovieViewOutput
extension MoviePresenter: MovieViewOutput {
    func viewIsReady() {
        loadData()
    }
    
    func didTapBookNow() {
        router?.gotoWebView()
    }
}
