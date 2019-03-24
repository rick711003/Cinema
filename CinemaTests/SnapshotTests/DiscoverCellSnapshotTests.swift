//
//  DiscoverCellSnapshotTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import Cinema

final class DiscoverCellSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNilDefault() {
        let cell = UINib(nibName: "DiscoverCell", bundle: nil).instantiate(withOwner: nil,
                                                                               options: nil)[0] as! DiscoverCell
        cell.configCell(cellViewModel: nil)
        
        verifyView(cell)
    }
    
    func testDefault() {
        let mockDiscoverCellViewModel = DiscoverCellViewModel(imageNames: [""],
                                                              title: "Normal movie name",
                                                              popularity: 9.999)
        let cell = UINib(nibName: "DiscoverCell", bundle: nil).instantiate(withOwner: nil,
                                                                           options: nil)[0] as! DiscoverCell
        cell.configCell(cellViewModel: mockDiscoverCellViewModel)
        
        verifyView(cell)
    }
}

extension FBSnapshotTestCase {
    
    func verifyView(_ cell: UITableViewCell) {
        cell.contentView.setNeedsUpdateConstraints()
        cell.contentView.updateConstraintsIfNeeded()
        
        cell.contentView.setNeedsLayout()
        cell.contentView.layoutIfNeeded()

        let fittingSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        cell.frame.size = CGSize(width: 375, height: fittingSize.height)
        FBSnapshotVerifyView(cell)
    }
    
}
