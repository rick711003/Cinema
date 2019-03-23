//
//  MovieInteractor.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

final class MovieInteractor {
    weak var output: MovieInteractorOutput?
    private var service: TMDBService
    init(with service: TMDBService) {
        self.service = service
    }
}

// MARK: - MovieInteractorInput
extension MovieInteractor: MovieInteractorInput {
    func requestMovie(movieId: Int) {
        service.getMovie(movieId: movieId) { (movie) in
            if let movie: Movie = movie {
                self.output?.didReceiveMovieData(movie: movie)
            }
        }
    }
}
