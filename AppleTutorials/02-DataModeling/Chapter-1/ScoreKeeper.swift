//
//  ScoreKeeper.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 08.06.2026.
//

import SwiftUI
import Foundation

struct ScoreKeeper: View {
    @State private var players: [Player] = [
        Player("Евгений"),
        Player("Жанна"),
        Player("Михаил"),
        Player("Ксения")
    ]
    

    var body: some View {
        VStack(alignment: .leading) {
            Text("ScoreKeeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid() {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach(0..<players.count, id: \.description) { index in
                    GridRow {
                        TextField("Name: ", text: $players[index].name)
                        Text("\(players[index].score)")
                        Stepper("", value: $players[index].score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(""))
                
            }
            
            Spacer()
        }
        .padding()
    }
}

struct Player: Identifiable {
    let id: UUID = UUID()
    var name: String
    var score: Int = 0
    
    init(_ name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}

#Preview {
    ScoreKeeper()
}
