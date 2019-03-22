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
    
    @IBOutlet private var tableView: UITableView!
    
    private let cellNibName = String(describing: DiscoverCell.self)
    private let refreshControl = UIRefreshControl()
    private var viewModel: DiscoverViewModel?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        output?.viewIsReady()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
    }
    
    @objc private func refreshDisverData(_ sender: Any) {
        refreshControl.beginRefreshing()
        output?.refreshDiscoverData()
    }
}

private extension DiscoverViewController {

    func setupView() {
        let nibObject = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nibObject, forCellReuseIdentifier: cellNibName)
        tableView.tableFooterView = UIView()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh...")
        refreshControl.addTarget(self, action: #selector(refreshDisverData(_:)), for: .valueChanged)
    }
    
   func dataSource() -> [DiscoverDetail]? {
        guard let dataSource  = self.viewModel?.dataSource else {
            return nil
        }
        return dataSource
    }
    
    func transformImageURL(subURL: String?) -> String {
        guard let subURL = subURL else {
            return ""
        }
        let imageBaseURL = "https://image.tmdb.org/t/p/w500"
        return imageBaseURL + subURL
    }
    
    func loadNextPage() -> [DiscoverDetail]? {
        return nil
    }
}

// MARK: - DiscoverViewInput
extension DiscoverViewController: DiscoverViewInput {
    
    func updateNavigationTitle(with navigationTitle: String) {
        title = navigationTitle
        navigationItem.backBarButtonItem = UIBarButtonItem()
    }
    
    func discoverReloadData(viewModel: DiscoverViewModel) {
        if refreshControl.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.refreshControl.endRefreshing()
                self.viewModel = viewModel
                self.tableView.reloadData()
            }
        } else {
            self.viewModel = viewModel
            tableView.reloadData()
        }
    }
}

// MARK: - DiscoverCellDelegate
extension DiscoverViewController: DiscoverCellDelegate {
    
    func didTapDiscover(_ cell: DiscoverCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        output?.didTapDiscoverCell(cellIndex: indexPath.row)
    }
    
}


extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let dataSource = dataSource() else {
            return
        }
        let lastElement = dataSource.count - 1
        if indexPath.row == lastElement {
            output?.loadNextPage()
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource() else {
            return 0
        }
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellNibName),
            let results = dataSource() else {
                fatalError("Can not dequeue cell")
        }
        
        cell.selectionStyle = .none
        
        if let discoverCell = cell as? DiscoverCell {
            discoverCell.configCell(cellViewModel: DiscoverCellViewModel(
                imageNames: [transformImageURL(subURL: results[indexPath.row].backdropPath),
                             transformImageURL(subURL: results[indexPath.row].posterPath)],
                title: results[indexPath.row].title ?? "",
                popularity: results[indexPath.row].popularity ?? 0.0))
            discoverCell.delegate = self
        }
        
        return cell
    }
}
