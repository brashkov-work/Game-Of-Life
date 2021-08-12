//
//  CellModel.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import Foundation

struct CellModel {
    var isAlive: Bool = false
    
    static func makeDeadCell() -> CellModel {
        return CellModel(isAlive: false)
    }
    
    static func makeLiveCell() -> CellModel {
        return CellModel(isAlive: true)
    }
}
