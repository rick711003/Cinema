//
//  MoviePresenter.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

final class MoviePresenter {
    weak var view: MovieViewInput?
    var interactor: MovieInteractorInput?
    var router: MovieRouterInput?
}

// MARK: - MoviePresenterInput
extension MoviePresenter: MoviePresenterInput {
    
}

// MARK: - MovieInteractorOutput
extension MoviePresenter: MovieInteractorOutput {
    
}

// MARK: - MovieViewOutput
extension MoviePresenter: MovieViewOutput {
    func viewIsReady() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
