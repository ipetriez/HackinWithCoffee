//
//  MenuView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.drinks) { drink in
                                VStack {
                                    Text(drink.name)
                                }
                                .padding(.bottom)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drink")
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Menu())
}
