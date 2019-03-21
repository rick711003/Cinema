//
//  DiscoverPresenter.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

final class DiscoverPresenter {
    weak var view: DiscoverViewInput?
    var interactor: DiscoverInteractorInput?
    var router: DiscoverRouterInput?
    var currentPage: Int = 0
}

// MARK: - DiscoverPresenterInput
extension DiscoverPresenter: DiscoverPresenterInput {
    
}

// MARK: - DiscoverInteractorOutput
extension DiscoverPresenter: DiscoverInteractorOutput {
    func didGetDiscoverData(discover: Discover) {
        currentPage = currentPage + 1
        view?.discoverReloadData(discover: discover)
    }
}

// MARK: - DiscoverViewOutput
extension DiscoverPresenter: DiscoverViewOutput {
    func viewIsReady() {}
    func viewWillAppear() {
        guard let interactor = interactor else {
            return
        }
        interactor.goToDiscoverNextPage(nextPage: currentPage)
    }
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
    
    func didTapDiscoverCell(cellIndex: Int) {
        router?.gotoMovieDetail(movideId: cellIndex)
    }
}
