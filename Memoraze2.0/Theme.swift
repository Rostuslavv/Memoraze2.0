//
//  Theme.swift
//
//  Created by Rostyslav on 25.01.2022.
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var color: String
    
    init(name: String, emojis: Array<String>, numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.color = color
    }
}
