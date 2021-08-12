//
//  GameOfLife_GoSTests.swift
//  GameOfLife-GoSTests
//
//  Created by Boris Rashkov on 12.08.21.
//

import XCTest
@testable import GameOfLife_GoS

class GameOfLife_GoSTests: XCTestCase {

    private let gameOfLife = Game(width: 3, height: 3)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /* TEST #1
     * If a dead cell has 3 alive neighbours, it should become alive
     */
    func testBirthOfACell() {
        let gameBoard = GameState(cells:[CellModel.makeLiveCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell(),
                                         CellModel.makeLiveCell(), CellModel.makeLiveCell(), CellModel.makeDeadCell(),
                                         CellModel.makeDeadCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell()
            ])
        gameOfLife.setInitialState(gameBoard)
        XCTAssertTrue(gameOfLife.state(x: 1, y: 0))
    }
    /* TEST #2
     * If a cell has 2 live neighbors it should survive
     */
    func testSurvivalOfCellWithTwoNeighbours() {
        
        let boardWithTwoLiveCells = GameState(cells: [CellModel.makeDeadCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell(),
                                                      CellModel.makeLiveCell(), CellModel.makeLiveCell(), CellModel.makeLiveCell(),
                                                      CellModel.makeDeadCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell()])
        gameOfLife.setInitialState(boardWithTwoLiveCells)
        XCTAssertTrue(gameOfLife.state(x: 1, y: 1))
    }
    
    /* TEST #3
     * If a cell has 3 live neighbors it should survive
     */
    func testSurvivalOfCellWithThreeNeighbours() {
        
        let boardWithThreeLiveCells = GameState(cells: [CellModel.makeDeadCell(), CellModel.makeLiveCell(), CellModel.makeDeadCell(),
                                                        CellModel.makeDeadCell(), CellModel.makeLiveCell(), CellModel.makeLiveCell(),
                                                        CellModel.makeDeadCell(), CellModel.makeLiveCell(), CellModel.makeDeadCell()])
        
        gameOfLife.setInitialState(boardWithThreeLiveCells)
        XCTAssertTrue(gameOfLife.state(x: 1, y: 1))
    }
    
    /* TEST #4
     * If a cell has NO alive neighbors it should die
     */
    func testIfACellDies() {
        
        let boardWithLonelyState = GameState(cells: [CellModel.makeDeadCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell(),
                                            CellModel.makeDeadCell(), CellModel.makeLiveCell(), CellModel.makeDeadCell(),
                                            CellModel.makeDeadCell(), CellModel.makeDeadCell(), CellModel.makeDeadCell()])
        
        gameOfLife.setInitialState(boardWithLonelyState)
        XCTAssertEqual(false, gameOfLife.state(x: 1, y: 1))
        
    }
}
