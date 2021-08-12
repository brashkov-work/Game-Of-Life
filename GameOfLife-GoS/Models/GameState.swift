//
//  GameState.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import Foundation

struct GameState {
    var cells: [CellModel] = []
    
    subscript(index: Int) -> CellModel {
        get {
            return cells[index]
        } set {
            cells[index] = newValue
        }
    }
}

extension GameState: Equatable {
    
    public static func == (lhs: GameState, rhs: GameState) -> Bool {
        for lhsCell in lhs.cells {
            for rhsCell in rhs.cells {
                if lhsCell.isAlive != rhsCell.isAlive {
                    return false
                }
            }
        }
        return true
    }
}
