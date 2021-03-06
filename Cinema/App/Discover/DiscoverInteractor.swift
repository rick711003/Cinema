//
//  DiscoverInteractor.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

final class DiscoverInteractor {
    weak var output: DiscoverInteractorOutput?
    private var service: TMDBService
    init(with service: TMDBService) {
        self.service = service
    }
}

// MARK: - DiscoverInteractorInput
extension DiscoverInteractor: DiscoverInteractorInput {
    
    func requestDiscover(page: Int = 1) {
        service.getDiscover(page: page) { (discover, error) in
            if let discover: Discover = discover {
                self.output?.didReceiveDiscoverData(discover: discover)
            } else if let error = error {
                self.output?.gotError(with: error)
            }
        }
    }
}
