//
//  MenuView.swift
//  777 JACKPOT
//
//  Created by An Pham Hoang Thien on 19/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .opacity(0.6)
                    .ignoresSafeArea()
                
                VStack(spacing: 50){
                    NavigationLink(destination: UserListView){
                        Text("START")
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(.all, 20)
                            .background(.red)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: RuleView){
                        Text("RULES")
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
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
