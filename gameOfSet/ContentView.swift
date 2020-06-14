//
//  ContentView.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    var gameViewModel = SetGameVM()
    var body: some View{
        ZStack{
            HStack{
                Text("Score")
                Text("Set Game")
                    .font(.largeTitle)
                Button(action: {
                    self.gameViewModel.newSetGame()
                }){
                    Text("New Game")
                }
            }
        }
    }
}

struct vCard{
    var card: Card
    
    var body: some View{
        ZStack{
            if !card.isSelected{
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
