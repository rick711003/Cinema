//
//  File.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

struct Constants {
    // Network constants
    // Request constants elemment
    static let apiKey = "328c283cd27bd1877d9080ccb1604c91"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    static let discoverPath = "discover/movie"
    static let moviePath = "movie/"
    static let sortBy = "release_ date.desc"
    static let primaryReleaseDateLte = "2016-12-31"
    
    // Request field name
    static let apiKeyFieldName = "api_key"
    static let sortByFieldName = "sort_by"
    static let pageFieldName = "page"
    static let primaryReleaseDateLetFieldName = "primary_release_date.lte"
    
    // UI constants
    // String
    static let refreshString = "Refresh..."
    static let minsString = "mins"
    static let placeholderImageName = "clapboard.png"
    static let cellIdentifier = "cell"
    static let cinemaString = "Cinema"
    
    // Atray
    static let movieDetail = [ MovieDetailType.synopsis.rawValue,
                               MovieDetailType.genres.rawValue,
                               MovieDetailType.language.rawValue,
                               MovieDetailType.duration.rawValue]
}

enum MovieDetailType: String {
    case synopsis = "Synopsis"
    case genres = "Genres"
    case language = "Language"
    case duration = "Duration"
}
