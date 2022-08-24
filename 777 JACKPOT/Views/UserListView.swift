
//  UserListView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.


import SwiftUI

struct UserListView: View {
    var body: some View {
        NavigationView {
                    List(users){
                        user in
                        NavigationLink{
                            GameView(user: user)
                        } label: {
                            user.name
                        }

                    }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
