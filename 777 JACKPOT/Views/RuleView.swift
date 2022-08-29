//
//  RuleView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 25/08/2022.
//

import Foundation
import SwiftUI

struct RuleView: View {
    var body: some View {
        ZStack{
            Rectangle() //background ccolor
                .foregroundColor(.blue)
                .opacity(0.55)
                .ignoresSafeArea()
            VStack{
                Group{
                Text("777 SLOT MACHINE HOW TO PLAY")
                Text(" You will need to create a user before playing. Each player will start with 1000 credits, the goals in this game is to play the slot machine until you can get to the highest credit until you lose. To play the slot machine, you will need to spend credit, the ammount of credit can be chosen using the 'BET AMOUNT' button. Player can choose between spending 100 credits or 200 credits each play.")
            
                Text("To win in this slot machine, you just need to get the same 3 image, Winning using 100 credits will reward you 500 credits, 1200 credits if the bet amount is 200 credits.")
        
                Text("You will lose the game if the credit goes down to 0, there, you will get a choice to play again and try your luck one more time.")
                }.padding(50)
            }
        }
    }
}
