//
//  ContentView.swift
//  Lec6 Code
//
//  Created by CIS 1951 Staff on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gameStarted = false

    var body: some View {
        ZStack {
            GameAreaView(gameStarted: $gameStarted)
            
            if !gameStarted {
                Button(action: {
                    gameStarted = true
                }) {
                    Text("Start Game")
                        .font(.title)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
