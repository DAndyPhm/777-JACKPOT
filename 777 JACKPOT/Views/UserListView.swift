
//  UserListView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.


import SwiftUI

struct UserListView: View {
    @Binding var users: [User]
    var body: some View {
        
            NavigationView {
                    List{
                        ForEach(0...users.count-1, id: \.self) {user in
                            NavigationLink{
                                GameView(user: $users[user])
                            } label: {
                                UserRow(user: $users[user])
                            }
                        }
                    }
                    .navigationTitle("List of User")
                    .navigationBarItems(trailing: Button ("Add", action:
                                                            {
                        add()
                    }))
            }
        
    }
}

func add(){
    
}
