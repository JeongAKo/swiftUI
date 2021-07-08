//
//  ContentView.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    ScrollView{
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
        ForEach(viewModel.cards) { card in
          CardView(card: card)
            .aspectRatio(2/3, contentMode: .fit)
            .onTapGesture {
              viewModel.choose(card)
            }
        }
      }
    }
    .foregroundColor(.yellow)
    .padding(.horizontal)
  }
}




struct CardView: View {
  let card: MemoryGame<String>.Card
  
  let shape = RoundedRectangle(cornerRadius: 20)
  
  var body: some View {
    ZStack {
      if card.isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
  }
}

























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
      .preferredColorScheme(.light)
      .previewDevice("iPhone 12 mini")
    
    ContentView(viewModel: game)
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 12 mini")
    
  }
}
