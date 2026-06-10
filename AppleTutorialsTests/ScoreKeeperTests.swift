//
//  ScoreKeeperTests.swift
//  AppleTutorialsTests
//
//  Created by Evgeniy Polyak on 10.06.2026.
//

import Testing

@testable import AppleTutorials

struct ScoreKeeperTests {

    @Test("Reset players scores", arguments: [10, 20, 30])
    func resetScoreTest(to newValue: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var scoreboard = Scoreboard(players: [
            Player("Evgeniy", score: 23),
            Player("Jhanna", score: 23),
            Player("Mikhail", score: 20),
            Player("Ksenia", score: 20),
        ])
        scoreboard.resetScores(to: newValue)
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }

    @Test("Highest score wins")
    func highestScoreWinsTest() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player("Evgeniy", score: 23),
                Player("Jhanna", score: 23),
                Player("Mikhail", score: 20),
                Player("Ksenia", score: 20),
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )

        let winners = [
            Player("Evgeniy", score: 23),
            Player("Jhanna", score: 23),
        ]
        
        #expect(winners == scoreboard.winners)
    }
    
    @Test("Lower score wins")
    func lowerScoreWinsTest() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player("Evgeniy", score: 23),
                Player("Jhanna", score: 23),
                Player("Mikhail", score: 20),
                Player("Ksenia", score: 20),
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners  = [
            Player("Mikhail", score: 20),
            Player("Ksenia", score: 20),
        ]
        
        #expect(winners == scoreboard.winners)

    }

}
