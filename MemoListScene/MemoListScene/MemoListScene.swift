//
//  ContentView.swift
//  MemoListScene
//
//  Created by 고정아 on 2020/07/10.
//  Copyright © 2020 고정아. All rights reserved.
//

import SwiftUI

struct MemoListScene: View {

  
    var body: some View {
      List(store.list) { memo in
        Text(memo.content)
      }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
      .environmetObject(MemoStore())
    }
}
