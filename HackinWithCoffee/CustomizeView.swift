//
//  CustomizeView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 06.02.24.
//

import SwiftUI

struct CustomizeView: View {
    @State private var size = 0
    @State private var isDecaf = false
    
    private let drink: Drink
    private let sizeOptions = ["Small", "Medium", "Large"]
    private var caffeine: Int { 100 }
    private var calories: Int { 100 }
    
    init(drink: Drink) {
        self.drink = drink
    }
    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOptions.indices) { index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            
            Section("Estimates") {
                Text("**Caffeine** \(caffeine)mg")
                Text("**Calories** \(calories)")
            }
        }
        .navigationTitle(drink.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CustomizeView(drink: DeveloperPreview.mock.drink)
}
