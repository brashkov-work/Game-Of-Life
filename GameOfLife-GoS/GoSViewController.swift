//
//  ViewController.swift
//  GameOfLife-GoS
//
//  Created by Boris Rashkov on 12.08.21.
//

import UIKit

class GoSViewController: UIViewController {

    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    var dataSource: [CellModel]  = [] {
        didSet {
            self.boardCollectionView.reloadData()
        }
    }

    let pixelSize = 15
    var boardWidth: Int {
        let tempWidth = Int(floor(boardCollectionView.frame.size.width/CGFloat(pixelSize)))
        return tempWidth
    }
    var boardHeight: Int {
        let tempHeight = Int(floor(boardCollectionView.frame.size.height/CGFloat(pixelSize)))
        return tempHeight
        
    }

    var game: Game!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game = Game(width: boardWidth, height: boardHeight)
        game.addStateObserver { [weak self] state in
            self?.display(state)
        }
    }
    
    func display(_ state: GameState) {
        self.dataSource = state.cells
    }
}

extension GoSViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LifePointCollectionViewCell.self)", for: indexPath) as! LifePointCollectionViewCell
        cell.configureWithState(dataSource[indexPath.item].isAlive)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pixelSize, height: pixelSize)
    }

}


