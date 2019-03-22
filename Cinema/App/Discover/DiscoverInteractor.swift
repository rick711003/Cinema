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
}

// MARK: - DiscoverInteractorInput
extension DiscoverInteractor: DiscoverInteractorInput {
    
    func requestDiscover(page: Int = 1) {
        TMDBService.getDiscover(page: page) { (discover) in
            if let discover: Discover = discover {
                self.output?.didReceiveDiscoverData(discover: discover)
            }
        }
    }

}
