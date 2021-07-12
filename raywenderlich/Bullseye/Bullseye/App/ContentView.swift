//
//  ContentView.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
      VStack{
        Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
          .bold()
          .kerning(2.0)
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
         
        Text(String(game.target))
          .kerning(-1.0)
          .fontWeight(.black)
          .font(.largeTitle)
        HStack {
          Text("1")
            .bold()
            .padding()
          Slider(value: $sliderValue, in: 1.0...100.0)
          Text("100")
            .bold()
            .padding()
        }
        Button(action: {
          alertIsVisible = true
        }) {
          Text("Hit me")
            .alert(isPresented: $alertIsVisible) {
              let  rounedValue = Int(sliderValue.rounded())
              return Alert(title: Text("Hello there"),
                           message: Text("The slider vlaue is \(rounedValue). \n" + "Your scored \(game.points(sliderValue: rounedValue)) points is round."),
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
