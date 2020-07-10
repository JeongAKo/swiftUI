//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by 고정아 on 2020/07/10.
//  Copyright © 2020 고정아. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var a = 0
    var body: some View {
      VStack {
        Text("Hello, SwiftUI!~~")
          .font(.title)
          .foregroundColor(Color.yellow)
          .background(Color.blue)
        Text("Have a nice day :)")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
   
