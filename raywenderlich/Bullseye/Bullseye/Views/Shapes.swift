//
//  Shapes.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/14.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack {
      Circle()
        //          .inset(by: 10)
        //          .stroke(Color.blue, lineWidth: 20.0)
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: 200, height: 100)
      RoundedRectangle(cornerRadius: 20.0)
        .fill(Color.blue)
      Capsule()
        .fill(Color.blue)
      Ellipse()
        .fill(Color.blue)
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
