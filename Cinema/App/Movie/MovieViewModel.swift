//
//  MovieViewControllerViewModel.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 21/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

public struct MovieViewModel {
    
    public var movieId: Int
    public var movie: Movie?
    public var cellTitleName = ["Synopsis", "Genres", "Language", "Duration"]
    init(movieId: Int) {
        self.movieId = movieId
    }
    
}
