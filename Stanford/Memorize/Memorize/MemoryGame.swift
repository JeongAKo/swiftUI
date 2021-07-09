//
//  MemoryGame.swift
//  Memorize
//
//  Created by 고정아 on 2021/07/07.
//

import Foundation

//Model + Logic
struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  
  private var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get {
      cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
      //      var faceUpCardIndices = [Int]()
      //      for index in cards.indices { // cards.indices == 0..<cards.count
      //        if cards[index].isFaceUp {
      //           .append(index)
      //        }
    }
    set {
      cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}
      //        if index != newValue {
      //          cards[index].isFaceUp = false
      //        } else {
      //          cards[index].isFaceUp = true
      //        }
    }
  }
  
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
       !cards[chosenIndex].isFaceUp,
       !cards[chosenIndex].isMatched
    {
      if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFaceUp = true
      } else {  
        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
      }
    }
  }
  
  
  init(numberOfPairsCards: Int, creatCardContent: (Int) -> CardContent) {
    cards = []
    // add numberOfPairsCards * 2 cards to cards array
    for pairIndex in 0..<numberOfPairsCards {
      let content = creatCardContent(pairIndex)
      cards.append(Card(id: pairIndex*2, content: content))
      cards.append(Card(id: pairIndex*2+1, content: content))
    }
  }
  
  
  struct Card: Identifiable {
    let id: Int
    let content: CardContent
    var isFaceUp = true
    var isMatched = false
  }
}


extension Array {
  var oneAndOnly: Element? {
    if self.count == 1 {
      return self.first
    } else {
      return nil
    }
  }
}
