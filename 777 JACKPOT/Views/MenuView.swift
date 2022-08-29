//
//  MenuView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

struct MenuView: View {
    @State var UserArray = users
    @State var leaderboard: [String:Int] = UserDefaults.standard.object(forKey: "Leader") as? [String:Int] ?? [:]
    @StateObject var leader = Leader()
    @State private var showHighScoreView = false
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle() //background color
                    .foregroundColor(.blue)
                    .opacity(0.55)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    Image("777_Image")//display the slot machine's image
                        .resizable()
                        .frame(width: 500, height: 420, alignment: .center)
                        .scaledToFit()
                    Text("Welcome to 777 Jackpot slot machine")
                        .bold()
                        .foregroundColor(.yellow)
                    Spacer()
                    NavigationLink(destination: UserListView(users: $UserArray)){   //navigation link to the user list view
                        Text("START")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.blue)
                            .cornerRadius(20)
                        
                    }
                    
                    NavigationLink(destination: RuleView()){    //link to rule view
                        Text("RULES")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                                      
                    Button {
                            leaderboard = resetLeaderboard(lead: leaderboard, user: leader)
//                                            leaderboard[leader.name] = leader.score
//                                           UserDefaults.standard.removeObject(forKey: "Leader")
                        UserDefaults.standard.set(leaderboard, forKey: "Leader")    //user default to save thee highscore
                            showHighScoreView.toggle()  //show highscore sheet
                                        } label: {
                                            Text("Leaderboard")
                                                .bold()
                                                .foregroundColor(.yellow)
                                                .padding(.all, 20)
                                                .background(.blue)
                                                .cornerRadius(20)
                                                
                                                }.sheet(isPresented: $showHighScoreView) {
                                            LeaderboardView(leaderboard: leaderboard)
                                        }
                                    }
                                    
                                }
                            }.environmentObject(leader)
                        }
                    }

func resetLeaderboard(lead: [String:Int], user: Leader) -> [String:Int] { //function to sort the leader board
    var count = 0
    var sort = lead
    sort[user.name] = user.score
    for (_, _) in sort.sorted(by: {$0.value > $1.value}) {
        count += 1
    }
    return sort
}
