//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI
import Foundation


struct GameView(): View {
    
    private var symbols = ["7_Icon","bell_Icon","lemon_Icon"]
    private var bet_amount = 10
    
    @State private var credit = 1000
    @State private var list_number = [1, 2, 0]
    
    
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
                    Text("CREDITS: " + String(credit))
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
                    
                    self.credit -= 100
                }){
                    Text("Spin")
                        .bold()
                        .foregroundColor(.yellow)
                        .padding(.all, 20)
                        .background(.red)
                        .cornerRadius(20)
                }
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
