//
//  ContentView.swift
//
//  Created by Rostyslav on 21.01.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text("Score\(viewModel.score)").font(.largeTitle)
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 67))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .padding(.horizontal)
            
            Button {
                viewModel.newGame()
            } label: {
                Text("New Game").font(.largeTitle)
            }
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
    }
}

