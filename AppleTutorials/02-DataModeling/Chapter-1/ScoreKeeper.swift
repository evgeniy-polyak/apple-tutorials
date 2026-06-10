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
        }
        .padding(.vertical)
        
        
        .padding()
    }
}

#Preview {
    ScoreKeeper()
}
