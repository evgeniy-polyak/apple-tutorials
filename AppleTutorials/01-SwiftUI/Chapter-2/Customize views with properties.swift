//
//  1- Customize views with properties.swift
//  AppleTutorials
//
//  Created by Evgeniy Polyak on 03.06.2026.
//
// https://developer.apple.com/tutorials/develop-in-swift/customize-views-with-properties

import SwiftUI

struct Section_1_View: View {
    
    var body: some View {
        HStack {
            DayForecast(day: "Понедельник", hight: 25, low: 18)
            
            DayForecast(day: "Вторник", hight: 18, low: 15, isRainy: true)
        }
    }
}

struct DayForecast: View {
    let day: String
    let hight: Int
    let low: Int
    let isRainy: Bool
    
    var iconName: String {
        return isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    
    var iconColor: Color {
        return isRainy ? .blue : .yellow
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            
            Text("День: \(hight)º")
                .fontWeight(.semibold)
            Text("Ночь: \(low)º")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
    
    init(day: String, hight: Int, low: Int, isRainy: Bool = false) {
        self.day = day
        self.hight = hight
        self.low = low
        self.isRainy = isRainy
    }
}


#Preview("Вся погода") {
    Section_1_View()
}

#Preview("Погода - день") {
    let day = "Среда"
    DayForecast(day: "Среда", hight: 25, low: 18)
}
