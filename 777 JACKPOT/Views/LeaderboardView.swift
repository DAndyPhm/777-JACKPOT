//
//  LeaderboardView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 25/08/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @State var leaderboard : [String:Int]
        var body: some View {
            ZStack {
                
                Rectangle() //background ccolor
                    .foregroundColor(.blue)
                    .opacity(0.55)
                    .ignoresSafeArea()
                VStack {
                    Text("Leaderboard")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    ForEach(leaderboard.sorted(by: {$0.value > $1.value}), id: \.key) { key, value in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 50.0)
                            .foregroundColor(.blue)
                            .overlay(
                                HStack {
                                    Section(header: Text(key).foregroundColor(.yellow)) {
                                        Text("\(value)")
                                            .foregroundColor(.yellow)
                                    }
                                }.padding(10)
                            )
                        
                    }
                    Spacer()
                }
            }
        }
    }
