//
//  SettingsView.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 10.06.2026.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingsPoint: Int
    @Binding var doesHighestScoreWin: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins").tag(true)
                Text("Lowest Score Wins").tag(false)
            }
            
            Picker("Starting points", selection: $startingsPoint) {
                Text("0 starting points").tag(0)
                Text("10 starting points").tag(10)
                Text("20 starting point").tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @State var points = 10
    @Previewable @State var doesHighestScoreWin = true
    SettingsView(startingsPoint: $points, doesHighestScoreWin: $doesHighestScoreWin)
}
