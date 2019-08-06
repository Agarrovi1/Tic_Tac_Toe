//
//  vsComputerLogic.swift
//  Tic_Tac_Toe
//
//  Created by Angela Garrovillas on 8/3/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

/*
 1 | 2 | 3
 ----------
 4 | 5 | 6
 ----------
 7 | 8 | 9
 */
func generateRandomCornerTag() -> Int {
    let cornerTags = [1,3,7,9]
    
    if let random = cornerTags.randomElement() {
        return random
    }
    return 1
}
//func findPlayerOneSecondChoiceTag() -> Int {
//
//}
var diagonalTagsTLToBR = [1,5,9]
var diagonalTagsTRToBL = [3,5,7]
var twoXThenBlank = ["X","X",""]
var blankThenTwoX = ["","X","X"]
var xBlankX = ["X","","X"]
var oBlankO = ["O","","O"]
let oXO = ["O","X","O"]
let blankOO = ["","O","O"]
let OOBlank = ["O","O",""]

func lookForWinForComputer(game: GameBoard) -> (Bool,Int) {
    switch true {
    case game.matrix[0] == blankOO || [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == blankOO || [game.matrix[0][0],game.matrix[1][1],game.matrix[2][2]] == blankOO:
        return (true,1)
    case game.matrix[1] == blankOO || [game.matrix[1][0],game.matrix[0][0],game.matrix[2][0]] == blankOO:
        return (true,4)
    case game.matrix[2] == blankOO || [game.matrix[2][0],game.matrix[1][0],game.matrix[0][0]] == blankOO || [game.matrix[2][0],game.matrix[1][1],game.matrix[0][2]] == blankOO:
        return (true,7)
    case [game.matrix[0][2],game.matrix[0][1],game.matrix[0][0]] == blankOO || [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == blankOO || [game.matrix[0][2],game.matrix[1][1],game.matrix[2][0]] == blankOO:
        return (true,3)
    case [game.matrix[0][1],game.matrix[0][2],game.matrix[0][0]] == blankOO || [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == blankOO:
        return (true,2)
    case [game.matrix[1][2],game.matrix[1][1],game.matrix[1][0]] == blankOO || [game.matrix[1][2],game.matrix[0][2],game.matrix[2][2]] == blankOO:
        return (true,6)
    case [game.matrix[2][2],game.matrix[2][1],game.matrix[2][0]] == blankOO || [game.matrix[2][2],game.matrix[1][2],game.matrix[0][2]] == blankOO || [game.matrix[2][2],game.matrix[1][1],game.matrix[0][0]] == blankOO:
        return (true,9)
    case [game.matrix[2][1],game.matrix[2][2],game.matrix[2][0]] == blankOO || [game.matrix[2][1],game.matrix[1][1],game.matrix[0][1]] == blankOO:
        return (true,8)
    default:
        return (false,0)
    }
}
func lookToBlockForComputer(game: GameBoard) -> (Bool,Int) {
    switch true {
    case game.matrix[0] == blankThenTwoX || [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == blankThenTwoX || [game.matrix[0][0],game.matrix[1][1],game.matrix[2][2]] == blankThenTwoX:
        return (true,1)
    case game.matrix[1] == blankThenTwoX || [game.matrix[1][0],game.matrix[0][0],game.matrix[2][0]] == blankThenTwoX:
        return (true,4)
    case game.matrix[2] == blankThenTwoX || [game.matrix[2][0],game.matrix[1][0],game.matrix[0][0]] == blankThenTwoX || [game.matrix[2][0],game.matrix[1][1],game.matrix[0][2]] == blankThenTwoX:
        return (true,7)
    case [game.matrix[0][2],game.matrix[0][1],game.matrix[0][0]] == blankThenTwoX || [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == blankThenTwoX || [game.matrix[0][2],game.matrix[1][1],game.matrix[2][0]] == blankThenTwoX:
        return (true,3)
    case [game.matrix[0][1],game.matrix[0][2],game.matrix[0][0]] == blankThenTwoX || [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == blankThenTwoX:
        return (true,2)
    case [game.matrix[1][2],game.matrix[1][1],game.matrix[1][0]] == blankThenTwoX || [game.matrix[1][2],game.matrix[0][2],game.matrix[2][2]] == blankThenTwoX:
        return (true,6)
    case [game.matrix[2][2],game.matrix[2][1],game.matrix[2][0]] == blankThenTwoX || [game.matrix[2][2],game.matrix[1][2],game.matrix[0][2]] == blankThenTwoX || [game.matrix[2][2],game.matrix[1][1],game.matrix[0][0]] == blankThenTwoX:
        return (true,9)
    case [game.matrix[2][1],game.matrix[2][2],game.matrix[2][0]] == blankThenTwoX || [game.matrix[2][1],game.matrix[1][1],game.matrix[0][1]] == blankThenTwoX:
        return (true,8)
    default:
        return (false,0)
    }
}

func chooseAvailableBlankSpot(game: GameBoard) -> Int {
    switch "" {
    case game.matrix[0][0]:
        return 1
    case game.matrix[0][1]:
        return 2
    case game.matrix[0][2]:
        return 3
    case game.matrix[1][0]:
        return 4
    case game.matrix[1][2]:
        return 6
    case game.matrix[2][0]:
        return 7
    case game.matrix[2][1]:
        return 8
    default:
        return 9
    }
}

struct Computer {
    var computerChoice = 0
    
    mutating func changeComputerChoice(game: GameBoard) {
        self.computerChoice = self.determineBestChoiceForComputer(game: game)
    }
    
    private func determineBestChoiceForComputer(game: GameBoard) -> Int {
        let theCornerTags = [game.matrix[0][0],game.matrix[0][2],game.matrix[2][0],game.matrix[2][2]]
        //        var notCornerTags = [game.matrix[0][1],game.matrix[1][0],game.matrix[1][2],game.matrix[2][1]]
        
        let diagonal1 = [game.matrix[0][0],game.matrix[1][1],game.matrix[2][2]]
        let diagonal2 = [game.matrix[0][2],game.matrix[1][1],game.matrix[2][0]]
        
        switch game.turn {
        case 1:
            if game.matrix[1][1] == "X" {
                let randomCorner = generateRandomCornerTag()
                return randomCorner
            } else if game.matrix[1][1] != "X" {
                return 5
            }
        case 3:
            if game.matrix[1][1] == "X" {
                if theCornerTags.contains("X") {
                    if diagonal1 == blankThenTwoX {
                        return 1
                    } else if diagonal1 == twoXThenBlank {
                        return 9
                    } else if diagonal2 == blankThenTwoX {
                        return 3
                    } else if diagonal2 == twoXThenBlank {
                        return 7
                    } else if diagonal1 == ["O","X","X"] || diagonal1 == ["X","X","O"] {
                        let availableDiagonalTag = [3,7]
                        if let unwrap = availableDiagonalTag.randomElement() {
                            return unwrap
                        }
                    } else if diagonal2 == ["O","X","X"] || diagonal2 == ["X","X","O"] {
                        let availableDiagonalTag = [1,9]
                        if let unwrap = availableDiagonalTag.randomElement() {
                            return unwrap
                        }
                    }
                }
            } else if game.matrix[1] == blankThenTwoX {
                return 4
            } else if game.matrix[1] == twoXThenBlank {
                return 6
            } else if [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == twoXThenBlank {
                return 8
            } else if [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == blankThenTwoX {
                return 2
            } else if game.matrix[1][1] == "O" {
                if [game.matrix[1][0],game.matrix[0][0],game.matrix[0][1]] == xBlankX {
                    return 1
                } else if [game.matrix[0][1],game.matrix[0][2],game.matrix[1][2]] == xBlankX {
                    return 3
                } else if [game.matrix[1][2],game.matrix[2][2],game.matrix[2][1]] == xBlankX {
                    return 9
                } else if [game.matrix[1][0],game.matrix[2][0],game.matrix[2][1]] == xBlankX {
                    return 7
                } else if game.matrix[0] == blankThenTwoX {
                    return 1
                } else if game.matrix[0] == twoXThenBlank {
                    return 3
                } else if game.matrix[2] == blankThenTwoX {
                    return 7
                } else if game.matrix[2] == twoXThenBlank {
                    return 9
                } else if [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == blankThenTwoX {
                    return 1
                } else if [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == twoXThenBlank {
                    return 7
                } else if [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == blankThenTwoX {
                    return 3
                } else if [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == twoXThenBlank {
                    return 9
                }
            } else {
                return chooseAvailableBlankSpot(game: game)
            }
        case 5:
            let isThereWinForComp = lookForWinForComputer(game: game)
            let needToBlockForComp = lookToBlockForComputer(game: game)
            if isThereWinForComp.0 {
                return isThereWinForComp.1
            } else if needToBlockForComp.0 {
                return needToBlockForComp.1
            } else if game.matrix[1][1] == "X" {
                if game.matrix[0] == oBlankO {
                    return 2
                } else if game.matrix[2] == oBlankO {
                    return 8
                } else if [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == oBlankO {
                    return 4
                } else if [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == oBlankO {
                    return 6
                } else if game.matrix[0] == oXO {
                    return 8
                } else if game.matrix[2] == oXO {
                    return 2
                } else if [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == oXO {
                    return 6
                } else if [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == oXO {
                    return 4
                } else if diagonal1 == blankThenTwoX {
                    return 1
                } else if diagonal1 == twoXThenBlank {
                    return 9
                } else if diagonal2 == blankThenTwoX {
                    return 3
                } else if diagonal2 == twoXThenBlank {
                    return 7
                }
            } else if game.matrix[1][1] == "O" {
                return chooseAvailableBlankSpot(game: game)
            }
        default:
            let isThereWinForComp = lookForWinForComputer(game: game)
            let needToBlockForComp = lookToBlockForComputer(game: game)
            if isThereWinForComp.0 {
                return isThereWinForComp.1
            } else if needToBlockForComp.0 {
                return needToBlockForComp.1
            } else {
                return chooseAvailableBlankSpot(game: game)
            }
        }
        return chooseAvailableBlankSpot(game: game)
    }
}


