//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI
import Foundation


struct GameView: View {
    
    @State private var credit = 1000
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .opacity(0.6)
                .ignoresSafeArea()
                
            
            VStack{
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
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
