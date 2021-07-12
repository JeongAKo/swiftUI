//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by 고정아 on 2021/07/12.
//

import XCTest
@testable import Bullseye
class BullseyeTests: XCTestCase {
  
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
   game = nil
  }
  
  func testScorePsitive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
}
