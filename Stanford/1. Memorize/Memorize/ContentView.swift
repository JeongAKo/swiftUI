//
//  ContentView.swift
//  Memorize
//
//  Created by 고정아 on 2020/11/10.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    //ForEach(iteratablething //like Array, Dict, tuple,,,ets something can return object )
    HStack {
      ForEach(0..<4) { index in
        CardView(isfaceUp: true)
      }
    }
    
    .padding()
    .foregroundColor(Color.orange)
    .font(Font.largeTitle)
    
  }
}


struct CardView: View {
  var isfaceUp: Bool
  
  var body: some View {
    ZStack {
      if isfaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text("🎃")
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill()
      }
    }
  }
}




struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

