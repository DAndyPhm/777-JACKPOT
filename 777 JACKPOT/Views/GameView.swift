//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI
import Foundation


struct GameView: View {
    
    var symbols = ["7_Icon","bell_Icon","lemon_Icon"]
    var bet_amount = 10
    
    @State var credit = 1000
    @State var list_number = [1, 2, 0]
    @State var user : User
    @State var showLoseView = false
    @State var isDisable = false
    
    func isWin(){
        if list_number[0] == list_number[1] && list_number[1] == list_number[2]{
            user.credit += 500
            
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
                .opacity(0.6)
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
                    Image(symbols[list_number[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                    
                    Image(symbols[list_number[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                    
                    Image(symbols[list_number[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                }
                
                
                Button(action: {
                    self.list_number[0] = Int.random(in: 0...self.symbols.count-1)
                    self.list_number[1] = Int.random(in: 0...self.symbols.count-1)
                    self.list_number[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    user.credit -= 100
                    
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
            }
        
            if showLoseView{
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
                                        .background(Color("ColorRedRMIT"))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Button {
                                            self.showLoseView = false
                                            self.user.credit = 1000
                                            self.isDisable = true
                                        } label: {
                                            Text("New Game".uppercased())
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
