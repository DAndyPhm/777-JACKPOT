//
//  LeaderboardView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 25/08/2022.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .opacity(0.55)
                .ignoresSafeArea()
        }
        Text("This is the leaderboard view")
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
