//
//  UserRow.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 25/08/2022.
//

import Foundation
import SwiftUI

struct UserRow: View {
    @State var user: User
    var body: some View{
        ZStack{
            HStack{
                Text(user.name)
                Text(String(user.credit))
                Text(String(user.highscore))
            }
        }
    }
}
