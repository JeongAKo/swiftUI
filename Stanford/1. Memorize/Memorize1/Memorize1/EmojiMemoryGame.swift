//
//  EmojiMemoryGame.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/07.
//

import SwiftUI


// ViewModel
class EmojiMemoryGame: ObservableObject {
  
  static let emojis: Array<String> = ["🥑","🧢", "😀","🍋","🐶","🚧","🧽", "🧤", "🎒", "🐨", "👀", "🍦", "🥜", "🍫", "🚕", "🗿", "💸", "🔫", "💣", "💊", "💙", "♻️", "🏳️‍🌈", "⛄️"]
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsCards: 8) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  
//  private(set) var model: MemoryGame<String> = createMemoryGame()
  
  @Published private var model: MemoryGame<String> = createMemoryGame()

  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  
  // MARK: - Intent(s)
  func choose(_ card: MemoryGame<String>.Card) {
    objectWillChange.send()
    model.choose(card)
  }
}

