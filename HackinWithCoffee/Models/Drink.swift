//
//  Drink.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}
