//
//  Scoreboard.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 08.06.2026.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    let id: UUID = UUID()
    var name: String
    var score: Int = 0
    
    init(_ name: String, score: Int = 0) {
        self.name = name
        self.score = score
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
