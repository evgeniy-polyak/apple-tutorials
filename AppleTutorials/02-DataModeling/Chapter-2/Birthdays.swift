//
//  Birthdays.swift
//  AppleTutorials
//
//  Created by Евгений Поляк on 09.06.2026.
//

import SwiftData
import SwiftUI

struct Birthdays: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context

    //    @State private var friends: [Friend] = [
    //        Friend(name: "Elton Lin", birthday: .now),
    //        Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)),
    //    ]

    @State private var newFriendName: String = ""
    @State private var newFriendBirthday: Date = .now

    var body: some View {
        NavigationStack {
            if friends.count == 0 {
                Text("No friends")
                    .font(.title)
                    .padding(40)
            }
            List(friends, id: \.id) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(
                        friend.birthday,
                        format: .dateTime.year().month(.twoDigits).day()
                    )
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 20) {
                    Divider()
                    Text("New birthday")
                        .font(.headline)
                    DatePicker(
                        selection: $newFriendBirthday,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    ) {
                        TextField("Name:", text: $newFriendName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFiend = Friend(
                            name: newFriendName,
                            birthday: newFriendBirthday
                        )
                        context.insert(newFiend)
                        newFriendName = ""
                        newFriendBirthday = .now
                    }
                    .bold()
                    .padding(.bottom)
                }
            }
        }
        .padding()
        
    }
}

@Model
class Friend: Identifiable {
    var id = UUID()
    var name: String
    var birthday: Date

    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}

#Preview {
    Birthdays()
}
