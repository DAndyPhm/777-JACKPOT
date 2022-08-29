//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI
import Foundation


struct GameView: View {
    @EnvironmentObject var leader : Leader
    var symbols = ["7_Icon","bell_Icon","lemon_Icon"] //the 3 icons name
    //variable inizialiation
    @State var listNumber = [1, 2, 0] //list of number for the initial display of the slot macchine
    @Binding var user : User
    @State var showLoseView = false
    @State var isDisable = false
    @State var betAmount = true

    
    func achievementReward1(){
        if  user.highscore > 2000{
                playSound(sound: "AchievementRewarded", type: "mp3")
                user.isAchievement1 = true
        }
    }
    
    func achievementReward2(){
        if  user.highscore > 3000{
                playSound(sound: "AchievementRewarded", type: "mp3")
                user.isAchievement2 = true
                user.isAchievement1 = false
        }
    }
    
    func achievementReward3(){
        if  user.highscore > 4000{
                playSound(sound: "AchievementRewarded", type: "mp3")
                user.isAchievement3 = true
                user.isAchievement2 = false
        }
    }
    
    func isWin(){ //function will run if the user win
        if listNumber[0] == listNumber[1] && listNumber[1] == listNumber[2]{ //the 3 picture is the same
            playSound(sound: "Win", type: "mp3") //play a winning sound to notify the user
            if betAmount == true{//If the player bet low, only reward 500 credits
            user.credit += 500
            }
            else if betAmount == false{ //If the player bet high, will reward 1200 credits
                user.credit += 1200
            }
            if user.credit > user.highscore{ //If the user reach a new highscore, save it to the user infomation
                user.highscore = user.credit
                leader.name = user.name
                leader.score = user.highscore
                achievementReward1()
                achievementReward2()
                achievementReward3()
            }
        }
    }
    
    func isNoMoney(){   //Func will run if the user money dropped to 0
        if user.credit <= 0{
            showLoseView = true //enable lose view bool to show it
            isDisable = true   //Disable play button
            playSound(sound: "YouLose", type: "mp3")    //play sound to notify the player that they lost
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle() //background ccolor
                .foregroundColor(.blue)
                .opacity(0.55)
                .ignoresSafeArea()
                
            
            VStack(alignment: .center, spacing: 10){
                if user.isAchievement1 == true{
                    HStack{
                        Text("!GAMBLING VETERAN!")
                            .bold()
                            .foregroundColor(.red)
                    }
                }
                else if user.isAchievement2 == true{
                    HStack{
                        Text("!GAMBLING PRO!")
                            .bold()
                            .foregroundColor(.red)
                    }
                }
                else if user.isAchievement3 == true{
                    HStack{
                        Text("!GAMBLING GOD!")
                            .bold()
                            .foregroundColor(.red)
                    }
                }
                HStack{
                    Text("Welcome \(user.name)")
                        .bold()
                        .foregroundColor(.yellow)
                }
                
                HStack{ // TITLES
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("777 SLOT MACHINE")
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                HStack{ // CREDITS
                    Text("CREDITS: " + String(user.credit))
                        .bold()
                        .foregroundColor(.yellow)
                    
                }
                
                
                HStack{ //display the picture of the slotmchine
                    Image(symbols[listNumber[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                    
                    Image(symbols[listNumber[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                    
                    Image(symbols[listNumber[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                }
                
                
                Button(action: {    //play button, click to decrease money and roll the slot machine
                    playSound(sound: "Ring", type: "mp3") //each time the player roll, it will play a sound
                    self.listNumber[0] = Int.random(in: 0...self.symbols.count-1) //random the number to generate different picture
                    self.listNumber[1] = Int.random(in: 0...self.symbols.count-1)
                    self.listNumber[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    if self.betAmount == true{ //decrease the user credit based on the ammount bet
                        user.credit -= 100
                    }
                    else if self.betAmount == false{
                        user.credit -= 200
                    }
                    self.isWin()    //check if they win
                    self.isNoMoney() //check if they have no more credit left
                    
                }){
                    Text("Spin")
                        .bold()
                        .foregroundColor(.yellow)
                        .padding(.all, 20)
                        .background(.red)
                        .cornerRadius(20)
                }.disabled(isDisable)
                Button(action: {
                    self.betAmount.toggle()     //toggle the bet ammount each time it is pressed
                }){
                    if self.betAmount == true{       //condition to display the ammount that the user is beting
                        Text("BET AMOUNT: 100")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                    }
                    else if self.betAmount == false{
                        Text("BET AMOUNT: 200")
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                    }
                }.disabled(isDisable)
            }
            
            if showLoseView{    //pop up the notification that the player has lost
                            ZStack{
                                Color("ColorBlackTransparent")
                                    .edgesIgnoringSafeArea(.all)
                                VStack{
                                    Text("GAME OVER")
                                        .font(.system(.title, design: .rounded))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.red)
                                        .padding()
                                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Button {
                                            playSound(sound: "Replay", type: "mp3")
                                            self.showLoseView = false
                                            self.user.credit = 1000
                                            self.isDisable = false
                                        } label: {
                                            Text("Start over ?".uppercased())
                                                .font(.system(.title, design: .rounded))
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color.red)
                                                .padding()
                                                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                        }
                                        .padding(.vertical,10)
                                        .padding(.horizontal, 20)
                                    }
                                }
                            }
            }
        }
    }
}
