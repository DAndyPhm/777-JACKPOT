
//  UserListView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.


import SwiftUI

struct UserListView: View {
    @State var textFieldText: String = ""
    @Binding var users: [User]
    var body: some View {
            NavigationView {
                VStack{
                TextField("Please enter your username: ", text: $textFieldText) //Text field for the player to create a new user
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                    .foregroundColor(.blue)
                
                Button(action: {
                    playSound(sound: "ButtonClick", type: "mp3") //play sound when add a new userr
                    saveUser()//function to save the user
                    
                }, label: {
                    Text("Save")
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                })
                    List{ //This list will display the user tht added into the game
                        ForEach(0...users.count-1, id: \.self) {user in
                            NavigationLink{
                                
                                GameView(user: $users[user]) //the user is binded, therefore will update
                            } label: {
                                UserRow(user: $users[user])
                            
                            }
                        }
                    }
                    .navigationTitle("List of User")
            }
        }
    }
    func saveUser(){
        users.append(User(name: textFieldText, credit: 1000, highscore: 1000)) //func to create new user from the textfield input
    }

}

