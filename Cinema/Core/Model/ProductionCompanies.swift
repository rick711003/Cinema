//
//  ProductionCompanies.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct ProductionCompanies: Decodable {
    
    public var productionCompanyId: Int?
    public var logoPath: String?
    public var name: String?
    public var originCountry: String?
    
    private enum CodingKeys: String, CodingKey {
        case productionCompanyId = "id"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productionCompanyId = try container.decodeIfPresent(Int.self, forKey: .productionCompanyId)
        self.logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
        self.originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
