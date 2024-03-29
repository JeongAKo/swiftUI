 //
 //  ContentView.swift
 //  Memorize
 //
 //  Created by 고정아 on 2021/07/05.
 //
 
 import SwiftUI
 
 struct EmojiMemoryGameView: View {
  @ObservedObject var game: EmojiMemoryGame
  @Namespace private var dealingNamespace
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        gameBody
        HStack {
          restart
          Spacer()
          shuffle
        }
        .padding(.horizontal)
      }
      deckBody
    }
    .padding()
  }
  
  @State private var dealt = Set<Int>()
  
  private func deal(_ card: EmojiMemoryGame.Card) {
    dealt.insert(card.id)
  }
  
  private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
    !dealt.contains(card.id)
  }
  
  private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
    var delay = 0.0
    if let index = game.cards.firstIndex(where: {$0.id == card.id}) {
      delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
    }
    return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
  }
  
  
  private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
    -Double(game.cards.firstIndex(where: {$0.id == card.id}) ?? 0)
  }
  
  
  
  
  var gameBody: some View {
    AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
      if isUndealt(card) || card.isMatched && !card.isFaceUp {
        Color.clear
      } else {
        CardView(card: card)
          .matchedGeometryEffect(id: card.id, in: dealingNamespace)
          .padding(4)
          .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
          // `.identity` means don't scaleing(any animation)
          .zIndex(zIndex(of: card))
          .onTapGesture {
            withAnimation {
              game.choose(card)
            }
          }
      }
    }
    .foregroundColor(CardConstants.color)
  }
  
  
  var deckBody: some View {
    ZStack {
      ForEach(game.cards.filter(isUndealt)) { card in
        CardView(card: card)
          .matchedGeometryEffect(id: card.id, in: dealingNamespace)
          .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
          .zIndex(zIndex(of: card))
      }
    }
    .frame(width: CardConstants.undealWidth, height: CardConstants.undealHeight)
    .foregroundColor(CardConstants.color)
    .onTapGesture {
      for card in game.cards {
        withAnimation(dealAnimation(for: card)) {
          deal(card)
        }
      }
    }
  }
  
  
  
  var shuffle: some View {
    Button("Shuffle") {
      withAnimation {
        game.shuffle()
      }
    }
  }
  
  
  
  var restart: some View {
    Button("Restart") {
      
      withAnimation{
        dealt = []
        game.restart()
      }
    }
  }
  
  private struct CardConstants {
    static let color = Color.yellow
    static let aspectRatio: CGFloat = 2/3
    static let dealDuration: Double = 0.5
    static let totalDealDuration: Double = 2
    static let undealHeight: CGFloat = 90
    static let undealWidth = undealHeight * aspectRatio
  }
 }
 
 
 
 
 struct CardView: View {
  let card: EmojiMemoryGame.Card
  @State private var animatedBounsRemaining: Double = 0
  
  //  private let card: EmojiMemoryGame.Card
  //  init(_ card: EmojiMemoryGame.Card) {
  //    self.card = card
  //  }
  
  
  var body: some View {
    GeometryReader(content: { geometry in
      ZStack {
        Group{
          if card.isConsumingBonusTime {
            Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBounsRemaining)*360-90))
              .onAppear{
                animatedBounsRemaining = card.bonusRemaining
                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                  animatedBounsRemaining = 0
                }
              }
          } else {
            
            Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360-90))
          }
        }
            .padding(5)
            .opacity(0.5)
        Text(card.content)
          .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
          .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
          .padding(5)
          .font(Font.system(size: DrawingConstants.fontSize))
          .scaleEffect(scale(thatFits: geometry.size)
          )
      }
      //      .modifier(Cardify(isFaceUp: card.isFaceUp))
      .cardify(isFaceUp: card.isFaceUp)
    })
  }
  
  private func scale(thatFits size: CGSize) -> CGFloat {
    min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
  }
  
  
  private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
  }
  
  private struct DrawingConstants {
    static let fontScale: CGFloat = 0.7
    static let fontSize: CGFloat = 32
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
