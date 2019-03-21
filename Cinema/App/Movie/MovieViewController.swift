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
    private let cellNibNames: [String] = [String(describing: DiscoverCell.self),
                                          String(describing: MovieDetailsCell.self),
                                          String(describing: MovieDetailsCell.self),
                                          String(describing: MovieDetailsCell.self),
                                          String(describing: MovieDetailsCell.self),
                                          String(describing: MovieDetailsCell.self),
                                          "Cell"]
    private let colors: [UIColor] = [.lightGray, .white]
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        for cellNibName in cellNibNames {
            let nibObject = UINib(nibName: cellNibName, bundle: nil)
            tableView.register(nibObject, forCellReuseIdentifier: cellNibName)
        }
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
    
    @IBAction func tapBookNow(_ sender: UIButton) {
        output?.didTapBookNow()
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellNibNames[indexPath.row]) else {
                fatalError("Can not dequeue cell")
            }
            cell.selectionStyle = .none
            
            if let discoverCell = cell as? DiscoverCell, indexPath.row == 0 {
                discoverCell.configCell(cellViewModel: DiscoverCellViewModel(
                    imageNames: ["https://image.tmdb.org/t/p/w500/elxRzqfone6RZYM5150UFEy5A7x.jpg",
                                 "https://image.tmdb.org/t/p/w500/3CDHvH8pRz4bYnXjwQzhuqzil2X.jpg",
                                 "https://image.tmdb.org/t/p/w500/pdxPtmuuOGbUV1QI1ySsOcYV4tW.jpg"],
                    title: "American Casino",
                    popularity: 0.6))
            } else if let movieDetailsCell = cell as? MovieDetailsCell {
                movieDetailsCell.configCell(cellViewModel: MovieDetailsCellViewModel(title:"Overview",
                                                                                     subTitle: "The quiet life of a terrier named Max is upended when his owner takes in Duke, a stray whom Max instantly dislikes.", backgroundColor: colors[indexPath.row % 2]))
            }
            
            return cell
        } else {
            let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: cellNibNames[indexPath.row])
            return cell
        }
    }
}

// MARK: - MovieViewInput
extension MovieViewController: MovieViewInput {
}
