//
//  Section-2. Design an interface.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 03.06.2026.
//
// https://developer.apple.com/tutorials/develop-in-swift/design-an-interface

import SwiftUI

struct Section_2_View: View {
    let gradientColors: [Color] = [
        .gradientTop,
        .gradientBottom
    ]
    
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview("Design an interface") {
    Section_2_View()
}
