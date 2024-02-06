//
//  ContentView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var menu = Menu()
    var body: some View {
        MenuView()
            .environmentObject(menu)
    }
}

#Preview {
    ContentView()
}
