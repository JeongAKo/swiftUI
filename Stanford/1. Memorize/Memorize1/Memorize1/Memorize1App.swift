//
//  Memorize1App.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/05.
//

import SwiftUI

@main
struct Memorize1App: App {
  let  game = EmojiMemoryGame()
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: game)
    }
  }
}
