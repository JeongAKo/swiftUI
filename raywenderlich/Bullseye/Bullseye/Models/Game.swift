//
//  Game.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/12.
//

import Foundation


struct Game {
  var target = Int.random(in: 0...100)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    let diffrence = abs(target - sliderValue) //abs - 절대값
    return 100 - diffrence
  }
}
