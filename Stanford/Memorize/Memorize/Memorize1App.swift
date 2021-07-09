//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 고정아 on 2021/07/05.
//

import SwiftUI

@main
struct MemorizeApp: App {
  private let game = EmojiMemoryGame()
  var body: some Scene {
    WindowGroup {
      EmojiMemoryGameView(game: game)
    }
  }
}
