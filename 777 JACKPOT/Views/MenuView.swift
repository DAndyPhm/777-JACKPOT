//
//  MenuView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .opacity(0.6)
                .ignoresSafeArea()
            
            HStack{
                Text("START")
                    .bold()
                
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
