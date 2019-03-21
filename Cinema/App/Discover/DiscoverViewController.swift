//
//  DiscoverViewController.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation
import UIKit

public final class DiscoverViewController: UIViewController {

    var output: DiscoverViewOutput?
    
    private let cellNibName = String(describing: DiscoverCell.self)
    private let refreshControl = UIRefreshControl()
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibObject = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nibObject, forCellReuseIdentifier: cellNibName)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        output?.viewIsReady()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        output?.viewDidAppear()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        output?.viewWillDisappear()
        
        super.viewWillDisappear(animated)
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        output?.viewDidDisappear()
        
        super.viewDidDisappear(animated)
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        print(refreshWeatherData)
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetching")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellNibName) else {
            fatalError("Can not dequeue cell")
        }
        cell.selectionStyle = .none
        
        if let discoverCell = cell as? DiscoverCell {
            discoverCell.configCell(cellViewModel: DiscoverCellViewModel(
                imageNames: ["https://image.tmdb.org/t/p/w500/elxRzqfone6RZYM5150UFEy5A7x.jpg",
                             "https://image.tmdb.org/t/p/w500/3CDHvH8pRz4bYnXjwQzhuqzil2X.jpg",
                             "https://image.tmdb.org/t/p/w500/pdxPtmuuOGbUV1QI1ySsOcYV4tW.jpg"],
                title: "American Casino",
                popularity: 0.6))
            discoverCell.delegate = self
        }
        
        return cell
    }
}

// MARK: - DiscoverViewInput
extension DiscoverViewController: DiscoverViewInput {
    func discoverReloadData(discover: Discover) {
    
    }
}

extension DiscoverViewController: DiscoverCellDelegate {
    func didTapDiscover(_ cell: DiscoverCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        output?.didTapDiscoverCell(cellIndex: indexPath.row)
    }
}
