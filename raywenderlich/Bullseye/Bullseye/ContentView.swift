//
//  ContentView.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  
  var body: some View {
      VStack{
        Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
          .bold()
          .kerning(2.0)
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
         
        Text("89")
          .kerning(-1.0)
          .fontWeight(.black)
          .font(.largeTitle)
        HStack {
          Text("1")
            .bold()
            .padding()
          Slider(value: .constant(50), in: 1.0...100.0)
          Text("100")
            .bold()
            .padding()
        }
        Button(action: {
          self.alertIsVisible = true
          print("🥁 \(alertIsVisible)")
        }) {
          Text("Hit me")
            .alert(isPresented: $alertIsVisible) {
              return Alert(title: Text("Hello there"),
                           message: Text("This is my first pop-up"),
                           dismissButton: .default(Text("Awesome!")
                           )
              )
            }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
//    ContentView()
//      .previewLayout(.fixed(width: 568, height: 320))
  }
}
