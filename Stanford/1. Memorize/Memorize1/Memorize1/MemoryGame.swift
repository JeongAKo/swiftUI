//
//  MemoryGame.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/07.
//

import Foundation

//Model
struct MemoryGame<CardContent> {
  private(set) var cards: Array<Card>
  
  func choose(_ card: Card) {
  
  }
  
  init(numberOfPairsCards: Int, creatCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    // add numberOfPairsCards * 2 cards to cards array
    for pairIndex in 0..<numberOfPairsCards {
      let content = creatCardContent(pairIndex)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  
  struct Card {
    var isFaceUp: Bool = false
    var isMAtched: Bool = false
    var content: CardContent
  }
 }
