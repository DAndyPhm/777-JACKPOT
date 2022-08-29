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
                Rectangle()
                    .foregroundColor(.blue)
                    .opacity(0.55)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    Image("777_Image")
                        .resizable()
                        .frame(width: 500, height: 350, alignment: .center)
                        .scaledToFit()
                    Text("Welcome to 777 Jackpot slot machine")
                        .bold()
                        .foregroundColor(.yellow)
                    Spacer()
                    NavigationLink(destination: UserListView(users: $UserArray)){
                        Text("START")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.blue)
                            .cornerRadius(20)
                        
                    }
                    
                    NavigationLink(destination: RuleView()){
                        Text("RULES")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                                      
                    Button {
                            leaderboard = resetLeaderboard(lead: leaderboard, player: leader)
//                                            leaderboard[leader.name] = leader.score
//                                           UserDefaults.standard.removeObject(forKey: "Leader")
                            UserDefaults.standard.set(leaderboard, forKey: "Leader")
                            showHighScoreView.toggle()
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

func resetLeaderboard(lead: [String:Int], player: Leader) -> [String:Int] {
    var count = 0
    var sortLead = lead
    sortLead[player.name] = player.score
    for (_, _) in sortLead.sorted(by: {$0.value > $1.value}) {
        count += 1
    }
    return sortLead
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
