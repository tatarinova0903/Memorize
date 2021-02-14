//
//  MemoryGame.swift
//  Memorize
//
//  Created by Дарья on 19.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import Foundation
// Model
struct MemoryGame {
    private(set) var cards: Array<Card>
    
    let emojies: Array<String>
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: String
    }
    
    init(emojies: Array<String>) {
        self.emojies = emojies
        cards = Array<Card>()
        for pairIndex in 0..<emojies.count {
            let content = emojies[pairIndex]
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        if openCardsCount() == 2 {
            let (firstOpenCardIndex, secondOpenCardIndex) = openCardsIndexes()
            if firstOpenCardIndex != nil && secondOpenCardIndex != nil {
                if cards[firstOpenCardIndex!].content == cards[secondOpenCardIndex!].content {
                    cards[firstOpenCardIndex!].isMatched = true
                    cards[secondOpenCardIndex!].isMatched = true
                }
                cards[firstOpenCardIndex!].isFaceUp = false
                cards[secondOpenCardIndex!].isFaceUp = false
            }
        }
        if let chosenIndex = cards.index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func openCardsCount() -> Int {
        var count = 0
        for card in cards {
            if card.isFaceUp && !card.isMatched { count += 1 }
        }
        return count
    }
    
    func openCardsIndexes() -> (Int?, Int?) {
        var index1: Int?
        var index2: Int?
        for index in 0..<cards.count {
            if cards[index].isFaceUp {
                if index1 == nil { index1 = index }
                else { index2 = index }
            }
        }
        return (index1, index2)
    }
    
}
