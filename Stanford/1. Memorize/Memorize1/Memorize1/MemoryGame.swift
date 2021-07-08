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
  
  mutating func choose(_ card: Card) {
    let chosenIndex = index(of: card)
    cards[chosenIndex].isFaceUp.toggle()
  }
  
  func index(of card: Card) -> Int {
    for i in 0..<cards.count {
      if cards[i].id == card.id { 
        return i
      }
    }
    return 0 // FIXME: bogus!
  }
  
  init(numberOfPairsCards: Int, creatCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    // add numberOfPairsCards * 2 cards to cards array
    for pairIndex in 0..<numberOfPairsCards {
      let content = creatCardContent(pairIndex)
      cards.append(Card(id: pairIndex*2, content: content))
      cards.append(Card(id: pairIndex*2+1, content: content))
    }
  }
  
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent
  }
 }
