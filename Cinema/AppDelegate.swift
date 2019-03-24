//
//  AppDelegate.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    var service: TMDBService?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        settingDefaultViewController()
        return true
    }
    
    private func settingDefaultViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController()
        service = TMDBService()
        let discoverViewModel = DiscoverViewModel()
        let discoverBuilder = DiscoverBuilder()
        let discoverViewController = discoverBuilder.build(with: discoverViewModel, service: service ?? TMDBService())
        navigationController?.pushViewController(discoverViewController, animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

