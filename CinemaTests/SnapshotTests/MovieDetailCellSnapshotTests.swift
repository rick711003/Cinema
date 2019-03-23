//
//  MovieDetailCellSnapshotTests.swift
//  CinemaTests
//
//  Created by Chen, Rick (Agoda) on 23/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import Cinema

final class MovieDetailCellSnapshotTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSysnopisDefault() {
        let movieDetailCellViewModel = MovieDetailsCellViewModel(title: "Sysnopis",
                                                                 description: "Otomo Kathsuhiro's short anime story",
                                                                 backgroundColor: .white)
        let cell = UINib(nibName: "MovieDetailsCell", bundle: nil).instantiate(withOwner: nil,
                                                                               options: nil)[0] as! MovieDetailsCell
        cell.configCell(cellViewModel: movieDetailCellViewModel)
        
        verifyView(cell)
    }
    
    func testGenresDefault() {
        let movieDetailCellViewModel = MovieDetailsCellViewModel(title: "Genres",
                                                                 description: "Action, Drama",
                                                                 backgroundColor: .gray)
        let cell = UINib(nibName: "MovieDetailsCell", bundle: nil).instantiate(withOwner: nil,
                                                                               options: nil)[0] as! MovieDetailsCell
        cell.configCell(cellViewModel: movieDetailCellViewModel)
        
        verifyView(cell)
    }
    
}
