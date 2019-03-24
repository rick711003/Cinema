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
    
    private var viewModel: DiscoverViewModel
    
    init(with model: DiscoverViewModel) {
        self.viewModel = model
    }
}

// MARK: - DiscoverInteractorOutput
extension DiscoverPresenter: DiscoverInteractorOutput {
    
    func didReceiveDiscoverData(discover: Discover) {
        viewModel.discoverResponse = discover
        viewModel.appendDataSource()
        view?.discoverReloadData(viewModel: viewModel)
    }
    
    func gotError(with error: Error) {
        view?.alertErrorMessage(error.localizedDescription)
    }
}

// MARK: - DiscoverViewOutput
extension DiscoverPresenter: DiscoverViewOutput {
    
    func viewIsReady() {
        loadData()
    }
    
    func viewWillAppear() {
        view?.updateNavigationTitle(with: viewModel.navigationTitle)
    }
    
    func didTapDiscoverCell(cellIndex: Int) {
        guard let dataSource = viewModel.dataSource,
            let movieId = dataSource[cellIndex].movieId,
            let movieName = dataSource[cellIndex].title else {
                return
        }
        
        router?.gotoMovieDetail(movideId: movieId, movieName: movieName)
    }
    
    func refreshDiscoverData() {
        loadData()
    }
    
    func loadNextPage() {
        viewModel.currentPage = viewModel.currentPage + 1
        loadData(viewModel.currentPage)
    }
}

private extension DiscoverPresenter {
    
    func loadData(_ page: Int = 1) {
        guard let interactor = interactor else {
            return
        }
        interactor.requestDiscover(page: page)
    }
}
