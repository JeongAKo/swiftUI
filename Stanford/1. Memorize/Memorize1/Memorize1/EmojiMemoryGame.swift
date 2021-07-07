//
//  EmojiMemoryGame.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/07.
//

import SwiftUI


// ViewModel
class EmojiMemoryGame {
  
  static let emojis: Array<String> = ["🥑","🧢", "😀","🍋","🐶","🚧","🧽", "🧤", "🎒", "🐨", "👀", "🍦", "🥜", "🍫", "🚕", "🗿", "💸", "🔫", "💣", "💊", "💙", "♻️", "🏳️‍🌈", "⛄️"]
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsCards: 4) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  private var model: MemoryGame<String> = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
}

