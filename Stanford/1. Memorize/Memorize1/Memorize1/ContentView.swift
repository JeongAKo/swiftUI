//
//  ContentView.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
  var emojis: Array<String> = ["🥑","🧢", "😀","🍋","🐶","🚧","🧽", "🧤", "🎒", "🐨", "👀", "🍦", "🥜", "🍫", "🚕", "🗿", "💸", "🔫", "💣", "💊", "💙", "♻️", "🏳️‍🌈", "⛄️"]
  @State var emojiCount: Int = 4
  var body: some View {
    VStack {
      ScrollView{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.yellow)
      Spacer()
      HStack {
        remove
        Spacer()
        Text("Shuffle")
        Spacer()
        add
      }
      .font(.largeTitle)
      .padding(.horizontal)
      .foregroundColor(.green)
    }
    .padding(.horizontal)
  }
  
  var remove: some View {
    Button {
      if emojiCount > 1 {
        emojiCount -= 1
      }
    } label: {
      VStack {
        Image(systemName: "minus.circle")
      }
    }
  }
  
  var add : some View {
    Button {
      if emojiCount < emojis.count {
        emojiCount += 1
      }
    } label: {
      VStack {
        Image(systemName: "plus.circle")
      }
    }
  }
}




struct CardView: View {
  var content: String
  @State var isFaceUp: Bool = true
  
  let shape = RoundedRectangle(cornerRadius: 20)
  
  var body: some View {
    ZStack {
      if isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
    .onTapGesture(perform: {
      isFaceUp = !isFaceUp
    })
  }
}

























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.light)
      .previewDevice("iPhone 12")
    
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 12")
    
  }
}
