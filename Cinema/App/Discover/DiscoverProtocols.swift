//
//  DiscoverProtocols.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

// MARK: - Presenter Input & Output

public protocol DiscoverPresenterInput: class {}

public protocol DiscoverPresenterOutput: class {}

// MARK: - View Input & Output

protocol DiscoverCellDelegate: class {
    func didTapDiscover(_ cell: DiscoverCell)
}

protocol DiscoverViewInput: class {
    func discoverReloadData(discover: Discover)
}

protocol DiscoverViewOutput {
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func didTapDiscoverCell(cellIndex: Int)
}

// MARK: - Interactor Input & Output

protocol DiscoverInteractorInput {
    func goToDiscoverNextPage(nextPage: Int)
}

protocol DiscoverInteractorOutput: class {
    func didGetDiscoverData(discover: Discover)
}

// MARK: - Router Input

protocol DiscoverRouterInput {
    func gotoMovieDetail(movideId: Int)
}
