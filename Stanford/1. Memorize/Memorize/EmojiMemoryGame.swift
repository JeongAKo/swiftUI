//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 고정아 on 2020/11/12.
//

import SwiftUI


//ViewModel
class EmojiMemoryGame {
  private var model: MemoryGame<String> = EmojiMemoryGame.creatMemoryGame()
  
  static func creatMemoryGame() -> MemoryGame<String> {
    let emojis: Array<String> = ["🎃", "👻", "🕷"]
    return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
      return emojis[pairIndex]
    }
  }
  
  
  // MARK: - Access to the Model
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: - Intent(s)
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
}

