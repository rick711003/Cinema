//
//  Movie.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct Movie: Decodable {
    
    public var adult: Bool?
    public var backdropPath: String?
    public var belongsToCollection: BelongsToCollection?
    public var budget: Int?
    public var genres: [Genre]?
    public var homepage: String?
    public var movieId: Int?
    public var imdbId: String?
    public var originalLanguage: String?
    public var originalTitle: String?
    public var overview: String?
    public var popularity: Float?
    public var posterPath: String?
    public var productionCompanies: [ProductionCompanies]?
    public var productionCountries: [ProductionCountries]?
    public var releaseDate: String?
    public var revenue: Int?
    public var runtime: Int?
    public var spokenLanguages: [SpokenLanguages]?
    public var status: String?
    public var tagline: String?
    public var title: String?
    public var video: Bool?
    public var voteAverage: Float?
    public var voteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case imdbId = "imdb_id"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case budget
        case genres
        case adult
        case homepage
        case overview
        case popularity
        case revenue
        case runtime
        case status
        case tagline
        case title
        case video
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.belongsToCollection = try container.decodeIfPresent(BelongsToCollection.self, forKey: .belongsToCollection)
        self.budget = try container.decodeIfPresent(Int.self, forKey: .budget)
        self.homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
        self.movieId = try container.decodeIfPresent(Int.self, forKey: .movieId)
        self.imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.productionCompanies = try container.decodeIfPresent([ProductionCompanies].self, forKey: .productionCompanies)
        self.productionCountries = try container.decodeIfPresent([ProductionCountries].self, forKey: .productionCountries)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
        self.runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        self.spokenLanguages = try container.decodeIfPresent([SpokenLanguages].self, forKey: .spokenLanguages)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}
