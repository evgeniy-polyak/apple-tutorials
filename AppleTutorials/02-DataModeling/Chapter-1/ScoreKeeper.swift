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
    private var startingsPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("ScoreKeeper")
                .font(.title)
                .bold()
                .padding(.bottom)

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
                        TextField("Name: ", text: $player.name)
                        Text("\(player.score)")
                        Stepper("", value: $player.score)
                            .labelsHidden()
                    }
                }
            }

            Spacer()
            Divider()
            HStack {
                Button("Add Player", systemImage: "plus.circle.fill") {
                    scoreboard.players.append(Player(""))
                }
                .padding()

                Spacer()

                Button("Clear scores", systemImage: "xmark.circle.fill") {
                    for i in 0..<scoreboard.players.count {
                        scoreboard.players[i].score = 0
                    }

                    // TODO: Реализовать очистку массива - красиво!
                    // scoreboard.players = scoreboard.players.map { }
                }
                .padding()
            }

            HStack(alignment: .center) {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingsPoints)
                    } label: {
                        Image(systemName: "play.fill")
                        Text("Start Game")
                            .frame(maxWidth: .infinity)
                            .padding(6)
                    }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
//                    .controlSize(.regular)

                case .playing:
                    Button {
                        scoreboard.state = .gameOver
                    } label: {
                        Image(systemName: "stop.fill")
                        Text("End Game")
                            .frame(maxWidth: .infinity)
                            .padding(6)
                    }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
                    
                case .gameOver:
                    Button {
                        scoreboard.state = .setup
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Reset Game")
                            .frame(maxWidth: .infinity)
                            .padding(6)
                    }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
                    
                }

                Spacer()
            }

        }
        .padding(.vertical)

        .padding()
    }
}

#Preview {
    ScoreKeeper()
}
