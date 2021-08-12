//
//  CellModel.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import Foundation
import UIKit

class CellModel {
    static let cellSize = 10
    
    var isAlive: Bool = false
    
    var cellColor: UIColor {
        return isAlive ?  UIColor.green : UIColor.white
    }
    
    init(isAlive: Bool) {
        self.isAlive = isAlive
    }
    
    static func makeDeadCell() -> CellModel {
        return CellModel(isAlive: false)
    }
    
    static func makeLiveCell() -> CellModel {
        return CellModel(isAlive: true)
    }
}
