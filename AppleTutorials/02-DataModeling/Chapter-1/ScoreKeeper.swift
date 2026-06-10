//
//  ScoreKeeper.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 08.06.2026.
//

import Foundation
import SwiftUI

struct ScoreKeeper: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingsPoints = 0
    @State private var doesHighestScoreWin = true

    var body: some View {
        VStack(alignment: .leading) {
            Text("ScoreKeeper")
                .font(.title)
                .bold()
                .padding(.bottom)

            SettingsView(
                startingsPoint: $startingsPoints,
                doesHighestScoreWin: $scoreboard.doesHighestScoreWin
            )
            .disabled(scoreboard.state != .setup)
            .padding(.bottom, 8)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                Divider()

                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name: ", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                        Stepper("", value: $player.score)
                            .labelsHidden()
                    }
                }
            }

            Spacer()

            Divider()
            HStack(alignment: .center) {
                Button {
                    scoreboard.players.append(Player(""))
                } label: {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Player")
                        .padding(6)
                }
                .opacity(scoreboard.state == .setup ? 1.0 : 0)


                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingsPoints)
                    } label: {
                        Image(systemName: "play.fill")
                        Text("Start Game")
                            .padding(6)
                    }
                    .font(.headline)

                case .playing:
                    Button {
                        scoreboard.state = .gameOver
                    } label: {
                        Image(systemName: "stop.fill")
                        Text("End Game")
                            .padding(6)
                    }
                    .font(.headline)

                case .gameOver:
                    Button {
                        scoreboard.state = .setup

                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Reset Game")
                            .padding(6)
                    }
                    .font(.headline)

                }

            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
//            .tint(.blue)

        }
        .padding(.vertical)

        .padding()
    }
}

#Preview {
    ScoreKeeper()
}
