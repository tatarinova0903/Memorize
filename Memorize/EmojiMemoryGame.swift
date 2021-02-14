//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Дарья on 19.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI
// ViewModel
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame
    
    private let emojies: [String]
    
    init(emojies: [String]) {
        self.model = MemoryGame(emojies: emojies)
        self.emojies = emojies
    }
    
//    static func createMemoryGame() -> MemoryGame {
//        let emojies = ["👻", "🎃", "🕷"]
//        return MemoryGame(numberOfPairsOfCards: emojies.count) { pairIndex in
//            emojies[pairIndex]
//        }
//    }
    
    // MARK: - Acess to the model
    var cards: Array<MemoryGame.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame.Card) {
        model.choose(card: card)
    }
    
    func restartGame() {
        model = MemoryGame(emojies: emojies)
    }
    
}
