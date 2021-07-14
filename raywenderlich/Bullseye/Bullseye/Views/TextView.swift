//
//  TextView.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/14.
//

import SwiftUI

struct InstructionTextView: View {
  var text: String
  
  var body: some View {    
    Text(text.uppercased())
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .fontWeight(.black)
      .font(.largeTitle)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLableText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35.0)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .font(.caption)
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionTextView(text: "Instruction")
      BigNumberText(text: "999")
      SliderLableText(text: "99")
      LabelText(text: "9")
    }
  }
}

