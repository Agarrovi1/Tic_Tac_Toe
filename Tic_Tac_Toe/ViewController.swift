//
//  ViewController.swift
//  Tic_Tac_Toe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMiddleButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var middleLeftButton: UIButton!
    @IBOutlet weak var middleMiddleButton: UIButton!
    @IBOutlet weak var middleRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomMiddleButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    @IBOutlet weak var diagonalTL: UILabel!
    @IBOutlet weak var diagonalMM: UILabel!
    @IBOutlet weak var diagonalBR: UILabel!
    
    @IBOutlet weak var diagonalTR: UILabel!
    @IBOutlet weak var diagonalMM2: UILabel!
    @IBOutlet weak var diagonalBL: UILabel!
    
    @IBOutlet weak var horizontalTop: UILabel!
    @IBOutlet weak var horizontalMid: UILabel!
    @IBOutlet weak var horizontalBot: UILabel!
    
    @IBOutlet weak var verticalFirst: UILabel!
    @IBOutlet weak var verticalSecond: UILabel!
    @IBOutlet weak var verticalThird: UILabel!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    
    var currentPlayer: Players = .one
    var ticTacToe = GameBoard()
    var scores = ScoreBoard()
    
   private func disableAllButtons() {
        topLeftButton.isEnabled = false
        topMiddleButton.isEnabled = false
        topRightButton.isEnabled = false
        middleLeftButton.isEnabled = false
        middleMiddleButton.isEnabled = false
        middleRightButton.isEnabled = false
        bottomLeftButton.isEnabled = false
        bottomMiddleButton.isEnabled = false
        bottomRightButton.isEnabled = false
    }
   private func enableAllButtons() {
        topLeftButton.isEnabled = true
        topMiddleButton.isEnabled = true
        topRightButton.isEnabled = true
        middleLeftButton.isEnabled = true
        middleMiddleButton.isEnabled = true
        middleRightButton.isEnabled = true
        bottomLeftButton.isEnabled = true
        bottomMiddleButton.isEnabled = true
        bottomRightButton.isEnabled = true
    }
   private func resetTitleOfButtons() {
        topLeftButton.setTitle("", for: .normal)
        topMiddleButton.setTitle("", for: .normal)
        topRightButton.setTitle("", for: .normal)
        middleLeftButton.setTitle("", for: .normal)
        middleMiddleButton.setTitle("", for: .normal)
        middleRightButton.setTitle("", for: .normal)
        bottomLeftButton.setTitle("", for: .normal)
        bottomMiddleButton.setTitle("", for: .normal)
        bottomRightButton.setTitle("", for: .normal)
    }
   private func resetTitleForButtonsForDisabledState() {
        topLeftButton.setTitle("", for: .disabled)
        topMiddleButton.setTitle("", for: .disabled)
        topRightButton.setTitle("", for: .disabled)
        middleLeftButton.setTitle("", for: .disabled)
        middleMiddleButton.setTitle("", for: .disabled)
        middleRightButton.setTitle("", for: .disabled)
        bottomLeftButton.setTitle("", for: .disabled)
        bottomMiddleButton.setTitle("", for: .disabled)
        bottomRightButton.setTitle("", for: .disabled)
    }
    
  private func translateWinToLine(game: GameBoard) -> Bool {
        switch true {
        case winDiagonalTopLeftToBotRight(game: game):
            diagonalTL.isHidden = false
            diagonalMM.isHidden = false
            diagonalBR.isHidden = false
            return true
        case winDiagonalTopRightToBotLeft(game: game):
            diagonalTR.isHidden = false
            diagonalMM2.isHidden = false
            diagonalBL.isHidden = false
            return true
        case winHorizontalTop(game: game):
            horizontalTop.isHidden = false
            return true
        case winHorizontalMid(game: game):
            horizontalMid.isHidden = false
            return true
        case winHorizontalBot(game: game):
            horizontalBot.isHidden = false
            return true
        case winVerticalFirstColumn(game: game):
            verticalFirst.isHidden = false
            return true
        case winVerticalSecondColumn(game: game):
            verticalSecond.isHidden = false
            return true
        case winVerticalThirdColum(game: game):
            verticalThird.isHidden = false
            return true
        default:
            return false
        }
    }
    
    
    @IBAction func ticTacToeButtonsPressed(_ sender: UIButton) {
        switch currentPlayer {
        case .one:
            sender.isEnabled = false
            ticTacToe.takesTagAndReplacesSpotInMatrix(tag: sender.tag, replaceWith: "X")
            sender.setTitle("X", for: .disabled)
            if translateWinToLine(game: ticTacToe) {
                disableAllButtons()
                scores.increasePOneWins()
                winLabel.isHidden = false
                ticTacToe.increaseTurnNumber()
            } else {
                currentPlayer = .two
                ticTacToe.increaseTurnNumber()
            }
        case .two:
            sender.isEnabled = false
            ticTacToe.takesTagAndReplacesSpotInMatrix(tag: sender.tag, replaceWith: "O")
            sender.setTitle("O", for: .disabled)
            if translateWinToLine(game: ticTacToe) {
                disableAllButtons()
                scores.increasePTwoWins()
                winLabel.isHidden = false
                ticTacToe.increaseTurnNumber()
            } else {
                currentPlayer = .one
                ticTacToe.increaseTurnNumber()
            }
        }
        self.playerOneLabel.text = "X Player One: \(scores.playerOneWins)"
        self.playerTwoLabel.text = "O Player Two: \(scores.playerTwoWins)"
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        enableAllButtons()
        resetTitleOfButtons()
        resetTitleForButtonsForDisabledState()
        ticTacToe = GameBoard()
        currentPlayer = .one
        winLabel.isHidden = true
        diagonalTL.isHidden = true
        diagonalMM.isHidden = true
        diagonalBR.isHidden = true
        diagonalTR.isHidden = true
        diagonalMM2.isHidden = true
        diagonalBL.isHidden = true
        horizontalTop.isHidden = true
        horizontalMid.isHidden = true
        horizontalBot.isHidden = true
        verticalFirst.isHidden = true
        verticalSecond.isHidden = true
        verticalThird.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topLeftButton.setTitleColor(UIColor.blue, for: .disabled)
        topMiddleButton.setTitleColor(UIColor.blue, for: .disabled)
        topRightButton.setTitleColor(UIColor.blue, for: .disabled)
        middleLeftButton.setTitleColor(UIColor.blue, for: .disabled)
        middleMiddleButton.setTitleColor(UIColor.blue, for: .disabled)
        middleRightButton.setTitleColor(UIColor.blue, for: .disabled)
        bottomLeftButton.setTitleColor(UIColor.blue, for: .disabled)
        bottomMiddleButton.setTitleColor(UIColor.blue, for: .disabled)
        bottomRightButton.setTitleColor(UIColor.blue, for: .disabled)
    }


}

