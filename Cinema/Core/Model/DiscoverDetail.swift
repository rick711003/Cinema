//
//  DiscoverDetail.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct DiscoverDetail: Decodable {
    
    public var movieId: Int?
    public var voteCount: Int?
    public var voteAverage: Float?
    public var video: Bool?
    public var adult: Bool?
    public var backdropPath: String?
    public var genreIDs: [Int]?
    public var originalLanguage: String?
    public var overview: String?
    public var popularity: Float?
    public var posterPath: String?
    public var releaseDate: String?
    public var title: String?
    
    private enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case adult
        case overview
        case popularity
        case title
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieId = try container.decodeIfPresent(Int.self, forKey: .movieId)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.genreIDs = try container.decodeIfPresent(Array.self, forKey: .genreIDs)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    }
}
