//
//  GameBoard.swift
//  Tic_Tac_Toe
//
//  Created by Angela Garrovillas on 8/2/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
//["","",""]
struct GameBoard {
    var matrix = [["","",""],["","",""],["","",""]]
    var turn = 0
    
    mutating func increaseTurnNumber() {
        turn += 1
    }
    
    mutating func takesTagAndReplacesSpotInMatrix(tag: Int,replaceWith: String) {
        switch tag {
        case 1:
            self.matrix[0][0] = replaceWith
        case 2:
            self.matrix[0][1] = replaceWith
        case 3:
            self.matrix[0][2] = replaceWith
        case 4:
            self.matrix[1][0] = replaceWith
        case 5:
            self.matrix[1][1] = replaceWith
        case 6:
            self.matrix[1][2] = replaceWith
        case 7:
            self.matrix[2][0] = replaceWith
        case 8:
            self.matrix[2][1] = replaceWith
        case 9:
            self.matrix[2][2] = replaceWith
        default:
            return
        }
    }
}

/*
 1 2 3
 4 5 6
 7 8 9
 */
