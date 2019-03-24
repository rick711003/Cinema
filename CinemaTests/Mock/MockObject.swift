//
//  MockObject.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit
@testable import Cinema

class MockNavigationController: UINavigationController {
    var pushCalled = false
    var pushedViewController: UIViewController? = nil
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushCalled = true
        self.pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class MockTMDBService: TMDBService {
    
    var error: Error? = nil
    
    var getDiscoverServiceCalled = false
    var discoverCurrentPage = 0
    var mockDiscover: Discover? = nil
    override func getDiscover(page: Int, completion: @escaping (_ discover: Discover?, _ error: Error?) -> Void) {
        getDiscoverServiceCalled = true
        discoverCurrentPage = page
        if mockDiscover != nil {
             completion(mockDiscover, nil)
        } else if error != nil {
            completion(nil, error)
        }
    }
    
    var getMovieServiceCalled = false
    var currentMovieId = 0
    var mockMovie: Movie? = nil
    override func getMovie(movieId: Int, completion: @escaping (_ movie: Movie?, _ error: Error?) -> Void) {
        getMovieServiceCalled = true
        currentMovieId = movieId
        if mockMovie != nil {
            completion(mockMovie, nil)
        } else if error != nil {
            completion(nil, error)
        }
    }
}

class MockDiscoverViewInput: DiscoverViewInput {
    var alertErrorMessageCalled = false
    var alertMessage = ""
    func alertErrorMessage(_ message: String) {
        alertErrorMessageCalled = true
        alertMessage = message
    }
    
    var updateNavigationTitleCalled = false
    var mockNavigationTitle = ""
    func updateNavigationTitle(with navigationTitle: String) {
        updateNavigationTitleCalled = true
        mockNavigationTitle = navigationTitle
    }
    
    var discoverReloadDataCalled = false
    var mockDiscoverViewModel: DiscoverViewModel?
    func discoverReloadData(viewModel: DiscoverViewModel) {
        discoverReloadDataCalled = true
        mockDiscoverViewModel = viewModel
    }
}

class MockDiscoverInteractorInput: DiscoverInteractorInput {
    var requestDiscoverCalled = false
    var requestionPage = 0
    func requestDiscover(page: Int) {
        requestDiscoverCalled = true
        requestionPage = page
    }
}

class MockDiscoverInteractorOutput: DiscoverInteractorOutput {
    var didReceiveDiscoverDataCalled = false
    var mockDiscover: Discover?
    func didReceiveDiscoverData(discover: Discover) {
        didReceiveDiscoverDataCalled = true
        mockDiscover = discover
    }
    
    var gotErrorCalled = false
    var mockError: Error = NSError(domain: "default error", code: 111, userInfo: nil)
    func gotError(with error: Error) {
        gotErrorCalled = true
        mockError = error
    }
}

class MockDiscoverRouterInput: DiscoverRouterInput {
    var gotoMovieDetailCalled = false
    var mockMovieId = 0
    var mockMovieName = ""
    func gotoMovieDetail(movideId: Int, movieName: String) {
        gotoMovieDetailCalled = true
        mockMovieId = movideId
        mockMovieName = movieName
    }
}

class MockDiscoverViewOutput: DiscoverViewOutput {
    
    var viewIsReadyCalled = false
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    var viewWillAppearCalled = false
    func viewWillAppear() {
        viewWillAppearCalled = true
    }
    
    var didTapDiscoverCellCalled = false
    func didTapDiscoverCell(cellIndex: Int) {
        didTapDiscoverCellCalled = true
    }
    
    var refreshDiscoverDataCalled = false
    func refreshDiscoverData() {
        refreshDiscoverDataCalled = true
    }
    
    var loadNextPageCalled = false
    func loadNextPage() {
        loadNextPageCalled = true
    }
}

class MockMovieViewInput: MovieViewInput {
    var alertErrorMessageCalled = false
    var alertMessage = ""
    func alertErrorMessage(_ message: String) {
        alertErrorMessageCalled = true
        alertMessage = message
    }
    
    var updateNavigationTitleCalled = false
    var mockNavigationTitle = ""
    func updateNavigationTitle(with navigationTitle: String) {
        updateNavigationTitleCalled = true
        mockNavigationTitle = navigationTitle
    }
    
    var movieReloadDataCalled = false
    var mockMovieViewModel: MovieViewModel?
    func movieReloadData(viewModel: MovieViewModel) {
        movieReloadDataCalled = true
        mockMovieViewModel = viewModel
    }
}

class MockMovieInteractorInput: MovieInteractorInput {
    
    var requestMovieCalled = false
    var mockMovieId: Int = 0
    func requestMovie(movieId: Int) {
        requestMovieCalled = true
        mockMovieId = movieId
    }
}

class MockMovieInteractorOutput: MovieInteractorOutput {
    var didReceiveMovieDataCalled = false
    var mockMovie: Movie?
    func didReceiveMovieData(movie: Movie) {
        didReceiveMovieDataCalled = true
        mockMovie = movie
    }
    
    var gotErrorCalled = false
    var mockError: Error = NSError(domain: "default error", code: 111, userInfo: nil)
    func gotError(with error: Error) {
        gotErrorCalled = true
        mockError = error
    }
}

class MockMovieRouterInput: MovieRouterInput {
    
    var gotoWebViewCalled = false
    func gotoWebView() {
        gotoWebViewCalled = true
    }
}

class MockMovieViewOutput: MovieViewOutput {
    
    var viewIsReadyCalled = false
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    var viewWillAppearCalled = false
    func viewWillAppear() {
        viewWillAppearCalled = true
    }
    
    var didTopBookNowCalled = false
    func didTapBookNow() {
        didTopBookNowCalled = true
    }
}

class MockDicover {
    var dicover: Discover?
    let dicoverString =
    """
    {
        "page": 1,
        "total_results": 341513,
        "total_pages": 17076,
        "results":[{
                    "vote_count": 71,
                    "id": 2,
                    "video": false,
                    "vote_average": 7,
                    "title": "Ariel",
                    "popularity": 5.236,
                    "poster_path": "/w0NzAc4Lv6euPtPAmsdEf0ZCF8C.jpg",
                    "original_language": "fi",
                    "original_title": "Ariel",
                    "genre_ids": [18,80,35],
                    "backdrop_path": "/z2QUexmccqrvw1kDMw3R8TxAh5E.jpg",
                    "adult": false,
                    "overview": "He escapes from prison but things don't go as planned...",
                    "release_date": "1988-10-21"
        }]
    }
    """
    
    init() {
        dicover = try! JSONDecoder().decode(Discover.self, from: dicoverString.data(using: .utf8)!)
    }
}

class MockMovie {
    var movie: Movie?
    let movieString = """
    {
        "adult": false,
        "backdrop_path": "/lubzBMQLLmG88CLQ4F3TxZr2Q7N.jpg",
        "belongs_to_collection": {
            "id": 427084,
            "name": "The Secret Life of Pets Collection",
            "poster_path": "/6efPtjryNVIYjQytNnCTJY5PK6f.jpg",
            "backdrop_path": "/fAibj0DIT8gk5jQtsEor66QKCsR.jpg"
        },
        "budget": 75000000,
        "genres": [
            {
                "id": 12,
                "name": "Adventure"
            },
            {
                "id": 35,
                "name": "Comedy"
            },
            {
                "id": 16,
                "name": "Animation"
            },
            {
                "id": 10751,
                "name": "Family"
            }
        ],
        "homepage": "http://www.thesecretlifeofpets.com/",
        "id": 328111,
        "imdb_id": "tt2709768",
        "original_language": "en",
        "original_title": "The Secret Life of Pets",
        "overview": "The quiet life of a terrier named Max is upended when his owner takes in Duke, a stray whom Max instantly dislikes.",
        "popularity": 5.192,
        "poster_path": "/WLQN5aiQG8wc9SeKwixW7pAR8K.jpg",
        "production_companies": [
            {
                "id": 33,
                "logo_path": "/8lvHyhjr8oUKOOy2dKXoALWKdp0.png",
                "name": "Universal Pictures",
                "origin_country": "US"
            },
            {
                "id": 3341,
                "logo_path": "/dTG5dXE1kU2mpmL9BNnraffckLU.png",
                "name": "Fuji Television Network",
                "origin_country": "JP"
            },
            {
                "id": 6704,
                "logo_path": "/fOG2oY4m1YuYTQh4bMqqZkmgOAI.png",
                "name": "Illumination Entertainment",
                "origin_country": "US"
            },
            {
                "id": 1778,
                "logo_path": "/69xm6sF3JxugGVjfZfm1YY6d7EE.png",
                "name": "Dentsu",
                "origin_country": "JP"
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "US",
                "name": "United States of America"
            }
        ],
        "release_date": "2016-06-18",
        "revenue": 875457937,
        "runtime": 87,
        "spoken_languages": [
            {
                "iso_639_1": "en",
                "name": "English"
            }
        ],
        "status": "Released",
        "tagline": "Think this is what they do all day?",
        "title": "The Secret Life of Pets",
        "video": false,
        "vote_average": 6.1,
        "vote_count": 5181
    }
"""
    init() {
        movie = try! JSONDecoder().decode(Movie.self, from: movieString.data(using: .utf8)!)
    }
}

