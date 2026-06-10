//
//  Scoreboard.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 08.06.2026.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    var id: UUID = UUID()
    var name: String
    var score: Int = 0
    
    init(_ name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}

struct Scoreboard {
    var players: [Player] = [
        Player("Евгений"),
        Player("Жанна"),
        Player("Михаил"),
        Player("Ксения")
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(winningScore, player.score)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(winningScore, player.score)
            }
            
        }
        
        return players.filter { $0.score == winningScore }
    }
    
    mutating func resetScores(to newValue: Int = 0) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}

enum GameState {
    case setup
    case playing
    case gameOver
}


#Preview {
    
}
