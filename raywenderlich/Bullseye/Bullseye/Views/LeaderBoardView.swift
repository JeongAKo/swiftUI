//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by 고정아 on 2021/07/15.
//

import SwiftUI

struct LeaderBoardView: View {
  @Binding var leaderBoardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) { i in
              let leaderboardEntry = game.leaderboardEntries[i]
              RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
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

struct HeaderView: View {
  @Binding var leaderBoardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var HorizontalSizeClass
  
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && HorizontalSizeClass == .compact {
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      }
      .padding(.top)
      HStack {
        Spacer()
        Button(action: {
          leaderBoardIsShowing = false
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}


struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.LeaderBoard.leaderDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.LeaderBoard.roundMaxRowWidth)
  }
}

struct LeaderBoardView_Previews: PreviewProvider {
  static private var leaderBoardIsShowing = Binding.constant(false)
  static private var game =  Binding.constant(Game(loadTestData: true))
  
  
  static var previews: some View {
    Group {
      LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        .previewLayout(.fixed(width: 812, height: 375)) // 1
        .environment(\.horizontalSizeClass, .compact) // 2
        .environment(\.verticalSizeClass, .compact) // 3
    }
    LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
      .preferredColorScheme(.dark)
  }
}
