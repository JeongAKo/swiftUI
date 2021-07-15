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
    ZStack {
      BackgroundView(game: $game)
      VStack{
        InstructionView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        
        if alertIsVisible  {
          PointsView(alertIsVisible: $alertIsVisible,
                     sliderValue: $sliderValue,
                     game: $game)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}


struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLableText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLableText(text: "100")
    }
    .padding()
  }
}


struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      withAnimation {
        alertIsVisible = true
      }
    }) {
      Text("Hit me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
      
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectViewCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    //    ContentView()
    //      .previewLayout(.fixed(width: 568, height: 320))
    
    ContentView()
      .preferredColorScheme(.dark)
  }
}
