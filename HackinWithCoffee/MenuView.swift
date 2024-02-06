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
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.drinks) { drink in
                                VStack {
                                    Text(drink.name)
                                        .font(.system(.body, design: .serif))
                                }
                                .padding(.bottom)
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
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
