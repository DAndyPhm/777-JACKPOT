//
//  User.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

class User : Identifiable{

    var name: String
    var credit: Int
    var isAchievement1: Bool
    var isAchievement2: Bool
    var isAchievement3: Bool
    var highscore: Int
    
    init(name: String, credit: Int, highscore: Int){
        self.name = name
        self.credit = credit
        self.isAchievement1 = false
        self.isAchievement2 = false
        self.isAchievement3 = false
        self.highscore = highscore
    }
}
