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

protocol DiscoverViewInput: class {}

protocol DiscoverViewOutput {
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

// MARK: - Interactor Input & Output

protocol DiscoverInteractorInput {}

protocol DiscoverInteractorOutput: class {}

// MARK: - Router Input

protocol DiscoverRouterInput {}
