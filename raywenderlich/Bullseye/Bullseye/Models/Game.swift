//
//  Game.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/12.
//

import Foundation


struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 0...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 30, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
    }
  }
  
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
  
  mutating func addToLeaderboard(point: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }
  
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 0...100)
    addToLeaderboard(point: points)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 0...100)
  }
}
