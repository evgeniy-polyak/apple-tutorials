//
//  Pick-a-Pal.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 04.06.2026.
//

import SwiftUI

struct Pick_a_Pal: View {
    @State private var nameList: [String] = [
        "Евгений", "Жанна", "Михаил", "Ксения",
    ]
    
    @State private var newName: String = ""
    @State private var pickedName = ""
//    @State private var schould
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? "" : pickedName)
            
            List {
                ForEach(nameList, id: \.description) { name in
                    Text(name)
                }
            }
//            .padding()
            
            TextField("Add name:", text: $newName)
                .autocorrectionDisabled()
                .onSubmit {
                    withAnimation {
                        if !newName.isEmpty {
                            nameList.append(newName)
                            newName = ""
                        }
                    }
                }
            
            Divider()
            Button("Pick Random Name") {
                if let randomName = nameList.randomElement() {
                    pickedName = randomName
                } else {
                    pickedName = ""
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    Pick_a_Pal()
}
