//
//  GameView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .ignoresSafeArea()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
