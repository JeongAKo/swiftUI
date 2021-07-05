//
//  ContentView.swift
//  Memorize1
//
//  Created by 고정아 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .stroke(lineWidth: 3)
        .padding(.horizontal)
      
      Text("Green").foregroundColor(.green)
    }
    .foregroundColor(.yellow)
    .padding()
    
    
    
  }
}


























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
  }
}
