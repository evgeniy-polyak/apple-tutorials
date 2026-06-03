//
//  FeaturesView.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 03.06.2026.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "A multiline description about a feature paired with the image on the left.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
        }
        .padding()
    }
}

#Preview {
    FeaturesView()
}
