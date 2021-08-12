//
//  LifePointCollectionViewCell.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import UIKit
import Foundation

class LifePointCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureWithState(_ isAlive: Bool) {
        self.cellView.backgroundColor = isAlive ?  UIColor.green : UIColor.white
    }
}

