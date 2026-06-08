//
//  Pick-a-Pal.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 04.06.2026.
//

import SwiftUI
import Foundation

struct Person: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

struct Pick_a_Pal: View {
    @State private var personList: [Person] = [
        
    ]
    
    @State private var newName: String = ""
    @State private var pickedName = " "
    @State private var schouldRemovePicked = false
    @State private var selectedID: Person.ID?
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? "" : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List(personList, selection: $selectedID) { name in
                Text(name.name)
                    .listRowBackground(name.id == selectedID ? Color.secondary.opacity(0.15) : nil)
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onChange(of: selectedID, { oldValue, newValue in
                if oldValue != newValue {
                    pickedName = personList.first(where: {$0.id == newValue})!.name
                }
            })
            .navigationTitle("Список Имен")
//            .padding()
            
            TextField("Add name:", text: $newName)
                .autocorrectionDisabled()
                .onSubmit {
                    withAnimation {
                        if !newName.isEmpty {
                            personList.append(Person(newName))
                            newName = ""
                        }
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $schouldRemovePicked)
            
            Button {
                if let randomName = personList.randomElement()?.name {
                    pickedName = randomName
                    if schouldRemovePicked {
                        personList.removeAll { name in
                            return name.name == pickedName
                        }
                        pickedName = " "
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Element")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    Pick_a_Pal()
}
