//
//  SwiftUITest1App.swift
//
//  Created by Rostyslav on 21.01.2022.
//

import SwiftUI

@main
struct SwiftUITest1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

