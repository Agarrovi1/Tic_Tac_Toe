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
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var vsButton: UIButton!
    @IBOutlet weak var drawLabel: UILabel!
    
    var currentPlayer: Players = .one
    var ticTacToe = GameBoard()
    var scores = ScoreBoard()
    var mode: Mode = .playerVsPlayer
    var computer = Computer()
    
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
    func checkIfButtonsAreDisabled() -> Bool {
        let arr = [topLeftButton,topMiddleButton,topRightButton,middleLeftButton,middleMiddleButton,middleRightButton,bottomLeftButton,bottomMiddleButton,bottomRightButton]
        var trueOrFalseArr = [Bool]()
        for a in arr {
            if let unwrap = a {
                if unwrap.isEnabled == false {
                    trueOrFalseArr.append(false)
                } else {
                    trueOrFalseArr.append(true)
                }
            }
        }
        if trueOrFalseArr.contains(true) {
            return false
        } else {
            return true
        }
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
    func showCompChoiceOnView(tag: Int) {
        switch tag {
        case 1:
            topLeftButton.isEnabled = false
            topLeftButton.setTitle("O", for: .disabled)
        case 2:
            topMiddleButton.isEnabled = false
            topMiddleButton.setTitle("O", for: .disabled)
        case 3:
            topRightButton.isEnabled = false
            topRightButton.setTitle("O", for: .disabled)
        case 4:
            middleLeftButton.isEnabled = false
            middleLeftButton.setTitle("O", for: .disabled)
        case 5:
            middleMiddleButton.isEnabled = false
            middleMiddleButton.setTitle("O", for: .disabled)
        case 6:
            middleRightButton.isEnabled = false
            middleRightButton.setTitle("O", for: .disabled)
        case 7:
            bottomLeftButton.isEnabled = false
            bottomLeftButton.setTitle("O", for: .disabled)
        case 8:
            bottomMiddleButton.isEnabled = false
            bottomMiddleButton.setTitle("O", for: .disabled)
        case 9:
            bottomRightButton.isEnabled = false
            bottomRightButton.setTitle("O", for: .disabled)
        default:
            return
        }
    }
    
    
    @IBAction func ticTacToeButtonsPressed(_ sender: UIButton) {
        switch mode {
        case .playerVsPlayer:
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
        case .playerVsComputer:
            sender.isEnabled = false
            ticTacToe.takesTagAndReplacesSpotInMatrix(tag: sender.tag, replaceWith: "X")
            sender.setTitle("X", for: .disabled)
            ticTacToe.increaseTurnNumber()
            if translateWinToLine(game: ticTacToe) {
                disableAllButtons()
                scores.increasePOneWins()
                winLabel.isHidden = false
                ticTacToe.increaseTurnNumber()
                break
            }
            guard checkIfButtonsAreDisabled() == false else {
                break
            }
            computer.changeComputerChoice(game: ticTacToe)
            ticTacToe.takesTagAndReplacesSpotInMatrix(tag: computer.computerChoice, replaceWith: "O")
            showCompChoiceOnView(tag: computer.computerChoice)
            ticTacToe.increaseTurnNumber()
            if translateWinToLine(game: ticTacToe) {
                disableAllButtons()
                scores.increaseCompWins()
                winLabel.isHidden = false
                ticTacToe.increaseTurnNumber()
            }
        }
        if translateWinToLine(game: ticTacToe) == false && ticTacToe.turn >= 9 {
            scores.tie()
        }
        self.drawLabel.text = "Draw: \(scores.draw)"
        self.computerLabel.text = "O Comp: \(scores.compWins)"
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
    
    @IBAction func vsButtonPressed(_ sender: UIButton) {
        switch mode {
        case .playerVsPlayer:
            mode = .playerVsComputer
            playerTwoLabel.isHidden = true
            computerLabel.isHidden = false
            vsButton.setTitle("Vs Player", for: .normal)
            if ticTacToe.turn % 2 != 0 {
                computer.changeComputerChoice(game: ticTacToe)
                ticTacToe.takesTagAndReplacesSpotInMatrix(tag: computer.computerChoice, replaceWith: "O")
                showCompChoiceOnView(tag: computer.computerChoice)
                ticTacToe.increaseTurnNumber()
                if translateWinToLine(game: ticTacToe) {
                    disableAllButtons()
                    scores.increaseCompWins()
                    winLabel.isHidden = false
                    ticTacToe.increaseTurnNumber()
                }
            }
        case .playerVsComputer:
            mode = .playerVsPlayer
            playerTwoLabel.isHidden = false
            computerLabel.isHidden = true
            vsButton.setTitle("Vs Computer", for: .normal)
        }
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

