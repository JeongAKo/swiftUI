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
    let bonus: Int
    if diffrence == 0 {
      bonus = 100
    } else  if diffrence <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 + bonus - diffrence
  }
  
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 0...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 0...100)
  }
}
