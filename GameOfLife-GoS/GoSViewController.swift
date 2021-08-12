//
//  ViewController.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import UIKit

class GoSViewController: UIViewController {
    
    private var gridViewWidht: CGFloat = 0
    private var gridViewHeight: CGFloat = 0
    
    var dataSource: [CellModel]  = []
    var game: Game!
    var gridView: GridView?

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        gridViewWidht = self.view.frame.size.width
        gridViewHeight = self.view.frame.size.height / 2
        
        self.gridView = GridView(frame: CGRect(x: 0, y: 0, width: Int(gridViewWidht), height: Int(gridViewHeight)))
        gridView!.delegate = self
        self.view.addSubview(gridView!)
        gridView!.center = self.view.center
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game = Game(width: Int(gridViewWidht) / Int(CGFloat(CellModel.cellSize)), height: Int(gridViewHeight) / Int(CellModel.cellSize))
        game.addStateObserver { [weak self] state in
            self?.display(state)
        }
    }
    
    func display(_ state: GameState) {
        self.dataSource = state.cells
       
        guard self.gridView != nil else { return }
        
        self.gridView!.setNeedsDisplay()
    }
}


