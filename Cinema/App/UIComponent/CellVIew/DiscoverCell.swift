//
//  DicoverCell.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 20/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit
import FSPagerView
import SDWebImage

private struct Constants {
    static let cellIdentifier = "cell"
    static let placeholderImageName = "placeholder.png"
}

class DiscoverCell: UITableViewCell {
    
    @IBOutlet weak var bottomContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityScoreLabel: UILabel!
    @IBOutlet weak var topContentView: FSPagerView! {
        didSet {
            self.topContentView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        }
    }
    
    var viewModel: DiscoverCellViewModel? = nil
    var delegate: DiscoverCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topContentView.transformer = FSPagerViewTransformer(type:.cubic)
        let transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.topContentView.itemSize = topContentView.frame.size.applying(transform)
        self.topContentView.decelerationDistance = 1
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    func configCell(cellViewModel: DiscoverCellViewModel?) {
        guard let viewModel = cellViewModel else {
            return
        }
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        popularityScoreLabel.text = String(viewModel.popularity)
        topContentView.reloadData()
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.didTapDiscover(self)
    }
}

extension DiscoverCell : FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        guard let viewModel = viewModel,
            viewModel.imageNames.count > 0 else {
            return 0
        }
        
        return viewModel.imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        guard let viewModel = viewModel,
            viewModel.imageNames.count > 0 else {
                return FSPagerViewCell()
        }
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, at: index)
        cell.imageView?.sd_setImage(with: URL(string: viewModel.imageNames[index]),
                                    placeholderImage: UIImage(named: Constants.placeholderImageName))
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
}

