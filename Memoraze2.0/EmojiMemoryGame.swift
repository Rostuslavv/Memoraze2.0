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
              emojis: ["โ๏ธ", "๐", "๐", "๐","๐","๐","๐","๐ต","๐","๐","๐บ","๐ธ","๐","๐ณ","๐ฐ"],
              numberOfPairsOfCards: 5,
              color: "red"),
        
        Theme(name: "Times",
              emojis: ["๐", "๐", "๐", "๐", "๐", "๐ฆ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ก", "๐ฃ"],
              numberOfPairsOfCards: 8,
              color: "blue"),
        
        Theme(name: "Flags",
              emojis: ["๐ง๐ช", "๐ฌ๐ง", "๐ง๐น", "๐ญ๐น", "๐ง๐ฎ", "๐ฌ๐ญ", "๐ด๓ ง๓ ข๓ ท๓ ฌ๓ ณ๓ ฟ", "๐ณ๏ธโโง๏ธ", "๐ฆ๐ฎ", "๐ธ๐ฟ", "๐ช๐ท", "๐ฉ๐ฒ", "๐ฏ๐ช", "๐ฌ๐ต", "๐จ๐ฒ", "๐ฑ๐ฆ", "๐ณ๐ท", "๐ฒ๐ด"],
              numberOfPairsOfCards: 7,
              color: "green"),
        
        Theme(name: "Faces",
              emojis: ["๐คจ", "๐", "๐", "๐ฃ", "๐ค", "๐ญ", "๐ก", "๐คฌ", "๐คฏ", "๐ณ", "๐ฅต", "๐", "๐", "๐", "๐ฅฐ", "๐", "๐ฅธ", "๐"],
              numberOfPairsOfCards: 9,
              color: "yellow"),
        
        Theme(name: "Hearts",
              emojis: ["โค๏ธ", "๐งก", "๐", "๐", "๐", "๐", "๐ค", "๐ค", "๐ค", "๐"],
              numberOfPairsOfCards: 5,
              color: "purple"),
        
        Theme(name: "Sports",
              emojis: ["โฝ๏ธ", "๐", "โพ๏ธ", "๐", "๐ฅ", "๐พ", "๐"],
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

