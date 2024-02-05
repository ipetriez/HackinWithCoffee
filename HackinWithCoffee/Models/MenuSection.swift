//
//  MenuSection.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
}
