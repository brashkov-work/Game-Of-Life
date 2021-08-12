//
//  GridView.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import Foundation
import UIKit

class GridView: UIView {
    
    private let cellSpacing = 2
    
    private var currentWidht: CGFloat = 0
    private var currentHeight: CGFloat = 0
    
    var delegate: GoSViewController?
    
    override func draw(_ rect: CGRect)
    {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        currentWidht = self.bounds.width
        currentHeight = self.bounds.height

        context.clear(CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height))
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height))
        context.fillPath()
        
        let cellSize = (width: CellModel.cellSize, height: CellModel.cellSize)
        let elementsOnXAxis: Int = Int(currentWidht) / cellSize.width
        
        context.setFillColor(UIColor.green.cgColor)
        
        guard let dataSource = delegate?.dataSource else { return }
        
        var cellIndex = 0
        for cell in dataSource {
            
            let cellY = (cellIndex / elementsOnXAxis)
            let cellX = (cellIndex - (cellY * elementsOnXAxis))
            
            if cell.isAlive {
                context.addRect(CGRect(x: cellX * cellSize.width , y: cellY * cellSize.height, width: cellSize.width, height: cellSize.height))
                context.fillPath()
            }
            cellIndex += 1
        }
    }
}
