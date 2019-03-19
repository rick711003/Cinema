//
//  Genre.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct Genre: Decodable {
    
    public var genreId: Int?
    public var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case genreId = "id"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genreId = try container.decodeIfPresent(Int.self, forKey: .genreId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
