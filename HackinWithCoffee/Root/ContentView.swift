//
//  ContentView.swift
//  HackinWithCoffee
//
//  Created by Sergey Petrosyan on 05.02.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var menu = Menu()
    @StateObject private var history = History()
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
            .environmentObject(history)
    }
}

#Preview {
    ContentView()
}
