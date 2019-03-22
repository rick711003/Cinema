//
//  DiscoverProtocols.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

// MARK: - DiscoverCell Delegate

protocol DiscoverCellDelegate: class {
    func didTapDiscover(_ cell: DiscoverCell)
}

// MARK: - View Input & Output

protocol DiscoverViewInput: class {
    func updateNavigationTitle(with navigationTitle: String)
    func discoverReloadData(viewModel: DiscoverViewModel)
}

protocol DiscoverViewOutput {
    func viewIsReady()
    func viewWillAppear()
    func didTapDiscoverCell(cellIndex: Int)
    func refreshDiscoverData()
    func loadNextPage()
}

// MARK: - Interactor Input & Output

protocol DiscoverInteractorInput {
    func requestDiscover(page: Int)
}

protocol DiscoverInteractorOutput: class {
    func didReceiveDiscoverData(discover: Discover)
}

// MARK: - Router Input

protocol DiscoverRouterInput {
    func gotoMovieDetail(movideId: Int, movieName: String)
}
