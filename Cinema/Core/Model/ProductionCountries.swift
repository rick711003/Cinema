//
//  ProductionCountries.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct ProductionCountries: Decodable {
    
    public var abbreviation: String?
    public var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case abbreviation = "iso_3166_1"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abbreviation = try container.decodeIfPresent(String.self, forKey: .abbreviation)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
