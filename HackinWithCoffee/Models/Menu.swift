//
//  Menu.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import Foundation

final class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            sections = menuData.sections
        } catch {
            fatalError("DEBUG: Couldn't find menu.json or decode it to data with the error: \(error)")
        }
    }
}
