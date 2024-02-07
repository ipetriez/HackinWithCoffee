//
//  CustomizeView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 06.02.24.
//

import SwiftUI

struct CustomizeView: View {
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var history: History
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    
    private let drink: Drink
    private let sizeOptions = ["Small", "Medium", "Large"]
    private let dismiss: () -> Void
    private var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60)
        if isDecaf {
            caffeineAmount /= 20
        }
        return caffeineAmount
    }
    
    private var calories: Int {
        var caloriesAmount = drink.baseCalories
        caloriesAmount += (extraShots * 10)
        if drink.coffeeBased {
            caloriesAmount += milk.calories
        } else {
            caloriesAmount += milk.calories / 8
        }
        caloriesAmount += syrup.calories
        return caloriesAmount * (size + 1)
    }
    
    init(drink: Drink, dismiss: @escaping () -> Void) {
        self.drink = drink
        self.dismiss = dismiss
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
                
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            
            Section("Customizations") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }
            
            Section("Estimates") {
                Text("**Caffeine** \(caffeine)mg")
                Text("**Calories** \(calories)")
            }
        }
        .navigationTitle(drink.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Save") {
                history.add(drink, size: sizeOptions[size], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)
                dismiss()
            }
        }
    }
}

#Preview {
    CustomizeView(drink: DeveloperPreview.mock.drink) { }
        .environmentObject(Menu())
}
