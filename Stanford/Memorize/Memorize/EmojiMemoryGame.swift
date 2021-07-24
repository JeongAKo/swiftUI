//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 고정아 on 2021/07/07.
//

import SwiftUI


// ViewModel bind View and Model (gate keeper)
class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
  
  private static let emojis: Array<String> = ["🥑","🧢", "😀","🍋","🐶","🚧","🧽", "🧤", "🎒", "🐨", "👀", "🍦", "🥜", "🍫", "🚕", "🗿", "💸", "🔫", "💣", "💊", "💙", "♻️", "🏳️‍🌈", "⛄️"]
  
  private static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsCards: 2) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  
//  private(set) var model: MemoryGame<String> = createMemoryGame()
  
  @Published private var model = createMemoryGame()

  var cards: Array<Card> {
    return model.cards
  }
  
  
  // MARK: - Intent(s)
  func choose(_ card: Card) {
    objectWillChange.send()
    model.choose(card)
  }
}

