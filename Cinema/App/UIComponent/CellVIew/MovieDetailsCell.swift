//
//  MovieDetailsCell.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 21/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import UIKit

class MovieDetailsCell: UITableViewCell {
    
     @IBOutlet weak var titleLabel: UILabel!
     @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: MovieDetailsCellViewModel? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(cellViewModel: MovieDetailsCellViewModel?) {
        guard let viewModel = cellViewModel else {
            return
        }
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.contentView.backgroundColor = viewModel.backgroundColor
    }
}
