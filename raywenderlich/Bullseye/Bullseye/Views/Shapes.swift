//
//  Shapes.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/14.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShape = true
  
  var body: some View {
    VStack {
      if !wideShape {
      Circle()
//      .inset(by: 10)
//      .stroke(Color.blue, lineWidth: 20.0)
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: 200, height: 100)
        .transition(.opacity)
      }
      
      RoundedRectangle(cornerRadius: 20.0)
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShape ? 200 : 100, height: 100)
      Button(action: {
        withAnimation {
          wideShape.toggle()
        }
      }) {
        Text("Animate!")
      }
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
