//
//  DeveloperPreview.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 06.02.24.
//

import Foundation

final class DeveloperPreview {
    
    static let mock = DeveloperPreview()
    
    private init() { }
    
    let drink = Drink(id: UUID(), name: "English tea", caffeine: [60, 120, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
    let configurationOption = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
