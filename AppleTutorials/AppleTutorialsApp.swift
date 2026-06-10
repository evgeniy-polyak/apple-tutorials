//
//  AppleTutorialsApp.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 03.06.2026.
//

import SwiftUI
import SwiftData

@main
struct AppleTutorialsApp: App {
    var body: some Scene {
        WindowGroup {
            Birthdays()
                .modelContainer(for: Friend.self)
        }
    }
}
