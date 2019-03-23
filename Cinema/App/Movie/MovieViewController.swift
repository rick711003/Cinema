//
//  MovieViewController.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation
import UIKit

public final class MovieViewController: UIViewController {
    var output: MovieViewOutput?
    enum cellNibNames: String {
        case DiscoverCell
        case MovieDetailsCell
    }
    private let colors: [UIColor] = [.lightGray, .white]
    private var viewModel: MovieViewModel?
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellNibNames.DiscoverCell.rawValue, bundle: nil),
                           forCellReuseIdentifier: cellNibNames.DiscoverCell.rawValue)
        tableView.register(UINib(nibName: cellNibNames.MovieDetailsCell.rawValue, bundle: nil),
                           forCellReuseIdentifier: cellNibNames.MovieDetailsCell.rawValue)
        output?.viewIsReady()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppear()
    }
    
    @IBAction func tapBookNow(_ sender: UIButton) {
        output?.didTapBookNow()
    }
}

private extension MovieViewController {
    func transformImageURL(subURL: String?) -> String {
        guard let subURL = subURL else {
            return ""
        }
        return Constants.imageBaseURL + subURL
    }
    
    func generateDescription(keyWord: String) -> String {
        guard let movie = viewModel?.movie else {
            return ""
        }
        switch keyWord {
        case MovieDetailType.synopsis.rawValue:
            return movie.overview ?? ""
        case MovieDetailType.genres.rawValue:
            return movie.genres?.map({ $0.name ?? "" }).joined(separator: ", ") ?? ""
        case MovieDetailType.language.rawValue:
            return movie.spokenLanguages?.map({ $0.name ?? ""}).joined(separator: ", ") ?? ""
        case MovieDetailType.duration.rawValue:
            return String(movie.runtime ?? 0) + Constants.minsString
        default:
            return ""
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard viewModel?.movie != nil else {
            return 0
        }
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellNibNames.DiscoverCell.rawValue),
            let movie = viewModel?.movie else {
                fatalError("Can not dequeue cell")
            }
            cell.selectionStyle = .none
            
            if let discoverCell = cell as? DiscoverCell {
                discoverCell.configCell(cellViewModel: DiscoverCellViewModel(
                    imageNames: [transformImageURL(subURL: movie.backdropPath),
                                 transformImageURL(subURL: movie.posterPath)],
                    title: movie.originalTitle ?? "",
                    popularity: movie.popularity ??  0.0))
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellNibNames.MovieDetailsCell.rawValue),
             let viewModel = viewModel else {
                fatalError("Can not dequeue cell")
            }
            cell.selectionStyle = .none
            if let movieDetailsCell = cell as? MovieDetailsCell {
                let title =  viewModel.cellTitleName[indexPath.row - 1]
                let cellViewModel = MovieDetailsCellViewModel(title: title,
                                                              description: generateDescription(keyWord: title),
                                                              backgroundColor: colors[indexPath.row % 2])
                movieDetailsCell.configCell(cellViewModel: cellViewModel)
            }
            return cell
        }
    }
}

// MARK: - MovieViewInput
extension MovieViewController: MovieViewInput {
    
    func updateNavigationTitle(with navigationTitle: String) {
        title = navigationTitle
        navigationItem.backBarButtonItem = UIBarButtonItem()
    }
    
    func movieReloadData(viewModel: MovieViewModel) {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}
