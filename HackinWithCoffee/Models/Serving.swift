//
//  Serving.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 06.02.24.
//

import Foundation

struct Serving: Identifiable, Codable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
