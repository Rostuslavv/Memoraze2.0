//
//  EmojiMemoryGame.swift
//
//  Created by Rostyslav on 24.01.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.creatememoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(name: "Autos",
              emojis: ["✈️", "🚁", "🚔", "🚀","🚈","🚖","🚘","🛵","🚊","🚟","💺","🛸","🚂","🛳","🛰"],
              numberOfPairsOfCards: 5,
              color: "red"),
        
        Theme(name: "Times",
              emojis: ["🕐", "🕑", "🕒", "🕓", "🕕", "🕦", "🕖", "🕗", "🕙", "🕛", "🕜", "🕝", "🕞", "🕡", "🕣"],
              numberOfPairsOfCards: 8,
              color: "blue"),
        
        Theme(name: "Flags",
              emojis: ["🇧🇪", "🇬🇧", "🇧🇹", "🇭🇹", "🇧🇮", "🇬🇭", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🏳️‍⚧️", "🇦🇮", "🇸🇿", "🇪🇷", "🇩🇲", "🇯🇪", "🇬🇵", "🇨🇲", "🇱🇦", "🇳🇷", "🇲🇴"],
              numberOfPairsOfCards: 7,
              color: "green"),
        
        Theme(name: "Faces",
              emojis: ["🤨", "😞", "😏", "😣", "😤", "😭", "😡", "🤬", "🤯", "😳", "🥵", "😀", "😃", "😘", "🥰", "😍", "🥸", "😎"],
              numberOfPairsOfCards: 9,
              color: "yellow"),
        
        Theme(name: "Hearts",
              emojis: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔"],
              numberOfPairsOfCards: 5,
              color: "purple"),
        
        Theme(name: "Sports",
              emojis: ["⚽️", "🏀", "⚾️", "🏈", "🥎", "🎾", "🏉"],
              numberOfPairsOfCards: 4,
              color: "orange"),
    ]
    
    static func creatememoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        case "pink":
            return .pink
        default:
            return .black
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.creatememoryGame(theme: theme)
    }
}

