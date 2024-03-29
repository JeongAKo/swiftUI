//
//  RoundViews.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/14.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .background(
        Circle().fill(Color("ButtonFilledBackgroundColor"))
      )
    //      .foregroundColor(Color("TextColor"))
  }
}


struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}


struct RoundedTextView: View {
  let text: String
  var body: some View {
    Text(text)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .stroke(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}



struct previewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundRectTextView(text: "100")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    previewView()
    previewView().preferredColorScheme(.dark)
  }
}
