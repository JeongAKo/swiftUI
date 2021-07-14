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
      .frame(width: 56, height: 56)
      .overlay(
        Circle()
          .stroke(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: 56, height: 56)
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
      .frame(width: 68.0, height: 56.0)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: 21.0)
          .stroke(lineWidth: 2.0)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct previewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundRectTextView(text: "100")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    previewView()
    previewView().preferredColorScheme(.dark)
  }
}
