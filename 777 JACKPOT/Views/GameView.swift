//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI
import Foundation


struct GameView: View {
    
    var symbols = ["7_Icon","bell_Icon","lemon_Icon"] //the 3 icons name
    
    
    @State var credit = 1000
    @State var listNumber = [1, 2, 0]
    @State var user : User
    @State var showLoseView = false
    @State var isDisable = false
    @State var betAmount = true
    
    func isWin(){
        if listNumber[0] == listNumber[1] && listNumber[1] == listNumber[2]{
            if betAmount == true{
            user.credit += 500
            }
            else if betAmount == false{
                user.credit += 1200
            }
            if user.credit > user.highscore{
                user.highscore = user.credit
            }
        }
    }
    
    func isNoMoney(){
        if user.credit <= 0{
            showLoseView = true
            isDisable = true
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .opacity(0.55)
                .ignoresSafeArea()
                
            
            VStack(alignment: .center, spacing: 10){
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
                
                
                HStack{
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
                
                
                Button(action: {
                    self.listNumber[0] = Int.random(in: 0...self.symbols.count-1)
                    self.listNumber[1] = Int.random(in: 0...self.symbols.count-1)
                    self.listNumber[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    if self.betAmount == true{
                        user.credit -= 100
                    }
                    else if self.betAmount == false{
                        user.credit -= 200
                    }
                    self.isWin()
                    self.isNoMoney()
                    
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
                            .foregroundColor(.yellow)
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
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Button {
                                            self.showLoseView = false
                                            self.user.credit = 1000
                                            self.isDisable = false
                                        } label: {
                                            Text("Start over ?".uppercased())
                                                .foregroundColor(.red)
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
