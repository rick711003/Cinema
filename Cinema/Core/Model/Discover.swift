//
//  Discover.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct Discover: Decodable {
    
    public var page: Int?
    public var totalResults: Int?
    public var totalPages: Int?
    public var results: [DiscoverDetail]?
    
    private enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
        case page
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.results = try container.decodeIfPresent([DiscoverDetail].self, forKey: .results)
    }
}
