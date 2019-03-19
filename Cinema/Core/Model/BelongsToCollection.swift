//
//  BelongsToCollection.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct BelongsToCollection: Decodable {
    
    public var collectionId: Int?
    public var backdropPath: String?
    public var name: String?
    public var posterPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case collectionId = "id"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.collectionId = try container.decodeIfPresent(Int.self, forKey: .collectionId)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
