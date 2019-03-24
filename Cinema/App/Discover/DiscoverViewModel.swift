//
//  DiscoverControllerViewModel.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 21/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

public struct DiscoverViewModel {
    
    public let navigationTitle: String = Constants.cinemaString
    public var discoverResponse: Discover?
    public var currentPage: Int = 1
    public var dataSource: [DiscoverDetail]? = []
    
    mutating func appendDataSource() {
        guard let results = discoverResponse?.results,
            var localDataSource = dataSource else {
                return
        }
        
        if !localDataSource.contains( where: { $0.movieId == results[0].movieId } ) {
            localDataSource.append(contentsOf: results)
            self.dataSource = localDataSource
        } else {
            self.dataSource = results
        }
        
    }
}
