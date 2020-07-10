//
//  Memo.swift
//  MemoListScene
//
//  Created by 고정아 on 2020/07/10.
//  Copyright © 2020 고정아. All rights reserved.
//

import SwiftUI

// Identifiable를 채택하면 데이터 목록을 테이블뷰나 컬렉션뷰에 쉽게 바인딩
// ObservedObject는 반응형 UI구현에 필요
class Memo: Identifiable, ObservedObject {
  let id: UUID
  @Published var content: String
  let insertDate: Date
  
  init(id: UUID = UUID(),
       content: String,
       insertDate: Date = Date()) {
    self.id = id
    self.content = content
    self.insertDate = insertDate
  }
}

extension Memo: Equatable {
  static func == (1hs: Memo, rhs: Memo) -> Bool {
    return 1hs.id == rhs.id
  }
}
