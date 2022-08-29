//
//  UserRow.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 25/08/2022.
//

import Foundation
import SwiftUI

struct UserRow: View {
    @Binding var user: User
    var body: some View{ //view showing the row of a user
        ZStack{
            HStack{
                Text("User: " + user.name)
                Text("Credit:\(user.credit)")
                Text("Highscore:\(user.highscore)")
            }
        }
    }
}
