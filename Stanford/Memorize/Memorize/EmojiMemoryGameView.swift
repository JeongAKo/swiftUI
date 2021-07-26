 //
 //  ContentView.swift
 //  Memorize
 //
 //  Created by 고정아 on 2021/07/05.
 //
 
 import SwiftUI
 
 struct EmojiMemoryGameView: View {
  @ObservedObject var game: EmojiMemoryGame
  
  var body: some View {
    AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
      CardView(card: card)
        .padding(4)
        .onTapGesture {
          game.choose(card)
        }
    }
    .foregroundColor(.yellow)
    .padding(.horizontal )
  }
 }
 
 
 
 
 struct CardView: View {
  let card: EmojiMemoryGame.Card
  
  //  private let card: EmojiMemoryGame.Card
  //  init(_ card: EmojiMemoryGame.Card) {
  //    self.card = card
  //  }
  
  let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
  
  var body: some View {
    GeometryReader(content: { geometry in
      ZStack {
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
          .padding(5)
          .opacity(0.5)
        Text(card.content).font(font(in: geometry.size))
      }
//      .modifier(Cardify(isFaceUp: card.isFaceUp))
      .cardify(isFaceUp: card.isFaceUp)
    })
  }
  
  
  private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.height)*DrawingConstants.fontScale)
  }
  
  private struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.7
    
  }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    game.choose(game.cards.first!)
    return EmojiMemoryGameView(game: game)
      .preferredColorScheme(.light)
      .previewDevice("iPhone 12 mini")
    
    //    EmojiMemoryGameView(game: game)
    //      .preferredColorScheme(.dark)
    //      .previewDevice("iPhone 12 mini")
    
  }
 }
