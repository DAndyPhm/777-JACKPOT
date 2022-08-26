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
    var achievement: String
    var highscore: Int
    
    init(name: String, credit: Int, achievement: String, highscore: Int){
        self.name = name
        self.credit = credit
        self.achievement = achievement
        self.highscore = highscore
    }
}
