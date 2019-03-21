//
//  MovieProtocols.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation

// MARK: - Presenter Input & Output

public protocol MoviePresenterInput: class {}

public protocol MoviePresenterOutput: class {}

// MARK: - View Input & Output

protocol MovieViewInput: class {}

protocol MovieViewOutput {
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func didTapBookNow()
}

// MARK: - Interactor Input & Output

protocol MovieInteractorInput {}

protocol MovieInteractorOutput: class {}

// MARK: - Router Input

protocol MovieRouterInput {
    func gotoWebView()
}
