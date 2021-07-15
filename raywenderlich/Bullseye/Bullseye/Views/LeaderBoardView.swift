//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/15.
//

import SwiftUI

struct LeaderBoardView: View {
  var body: some View {
    RowView(index: 1, score: 10, date: Date())
  }
}



struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.LeaderBoard.leaderDateColWidth)
      Spacer()
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.roundMaxRowWidth)
  }
}




struct LeaderBoardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderBoardView()
    LeaderBoardView()
      .preferredColorScheme(.dark)
  }
}
