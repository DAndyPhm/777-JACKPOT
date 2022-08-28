//
//  MenuView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

struct MenuView: View {
    @State var UserArray = users
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .opacity(0.55)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    NavigationLink(destination: UserListView(users: $UserArray)){
                        Text("START")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                        
                    }
                    
                    NavigationLink(destination: RuleView()){
                        Text("RULES")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                    }
                                      
                    NavigationLink(destination: LeaderboardView()){
                        Text("LEADERBOARD")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                    }
                }
                .navigationTitle("Main menu")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
