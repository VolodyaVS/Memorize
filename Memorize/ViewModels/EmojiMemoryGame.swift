//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 06.04.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "☃️", "🧸"]
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
