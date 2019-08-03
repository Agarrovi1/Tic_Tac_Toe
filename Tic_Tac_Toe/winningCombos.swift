//
//  winningCombos.swift
//  Tic_Tac_Toe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
let x = ["X","X","X"]
let o = ["O","O","O"]



func winDiagonalTopLeftToBotRight(game: GameBoard) -> Bool {
    return [game.matrix[0][0],game.matrix[1][1],game.matrix[2][2]] == x || [game.matrix[0][0],game.matrix[1][1],game.matrix[2][2]] == o
}
func winDiagonalTopRightToBotLeft(game: GameBoard) -> Bool {
    return [game.matrix[0][2],game.matrix[1][1],game.matrix[2][0]] == x || [game.matrix[0][2],game.matrix[1][1],game.matrix[2][0]] == o
}
func winHorizontalTop(game: GameBoard) -> Bool {
    return [game.matrix[0][0],game.matrix[0][1],game.matrix[0][2]] == x || [game.matrix[0][0],game.matrix[0][1],game.matrix[0][2]] == o
}
func winHorizontalMid(game: GameBoard) -> Bool {
    return [game.matrix[1][0],game.matrix[1][1],game.matrix[1][2]] == x || [game.matrix[1][0],game.matrix[1][1],game.matrix[1][2]] == o
}
func winHorizontalBot(game: GameBoard) -> Bool {
    return [game.matrix[2][0],game.matrix[2][1],game.matrix[2][2]] == x || [game.matrix[2][0],game.matrix[2][1],game.matrix[2][2]] == o
}
func winVerticalFirstColumn(game: GameBoard) -> Bool {
    return [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == x || [game.matrix[0][0],game.matrix[1][0],game.matrix[2][0]] == o
}
func winVerticalSecondColumn(game: GameBoard) -> Bool {
    return [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == x || [game.matrix[0][1],game.matrix[1][1],game.matrix[2][1]] == o
}
func winVerticalThirdColum(game: GameBoard) -> Bool {
    return [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == x || [game.matrix[0][2],game.matrix[1][2],game.matrix[2][2]] == o
}
