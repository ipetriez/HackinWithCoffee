//
//  MenuView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.matches(for: searchText)) { drink in
                                NavigationLink {
                                    CustomizeView(drink: drink) {
                                        dismiss()
                                    }
                                } label: {
                                    VStack {
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
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
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Menu())
}
