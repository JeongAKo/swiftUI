//
//  MemoryGame.swift
//  Memorize
//
//  Created by 고정아 on 2020/11/12.
//

import Foundation

// Model
struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  func choose(card: Card) {
    print("card chosen: \(card)")
  }
  
  init(numberOfPairsOfCards: Int, cardContentFactiory: (Int)-> CardContent) {
    cards = Array<Card>()
    for pairIIndex in 0..<numberOfPairsOfCards {
      let content: CardContent = cardContentFactiory(pairIIndex)
      cards.append(Card(content: content, id: pairIIndex * 2))
      cards.append(Card(content: content, id: pairIIndex * 2 + 1))
    }
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
