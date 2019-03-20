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
}

// MARK: - DiscoverPresenterInput
extension DiscoverPresenter: DiscoverPresenterInput {
    
}

// MARK: - DiscoverInteractorOutput
extension DiscoverPresenter: DiscoverInteractorOutput {
    
}

// MARK: - DiscoverViewOutput
extension DiscoverPresenter: DiscoverViewOutput {
    func viewIsReady() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
