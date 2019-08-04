//
//  ScoreBoard.swift
//  Tic_Tac_Toe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct ScoreBoard {
    var playerOneWins = 0
    var playerTwoWins = 0
    var draw = 0
    var compWins = 0
    
    mutating func increasePOneWins() {
        playerOneWins += 1
    }
    mutating func increasePTwoWins() {
        playerTwoWins += 1
    }
    mutating func tie() {
        draw += 1
    }
    mutating func increaseCompWins() {
        compWins += 1
    }
}
