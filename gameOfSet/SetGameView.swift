//
//  ContentView.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var gameViewModel:SetGameVM
    var body: some View{
        VStack{
            HStack{
                Text("Score")
                Text("Set Game")
                    .font(.largeTitle)
                Button(action: {
                    withAnimation(.easeInOut){
                        self.gameViewModel.newSetGame()
                    }
                }){
                    Text("New Game")
                }
            }
            Grid(self.gameViewModel.cardsArr){ card in
                CardView(card: card).onTapGesture {
                    self.gameViewModel.chooseCard(card: card)
                }
            }
            .padding(10)
        }
    }
}

struct CardView: View{
    var card: Card
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    func body(for size: CGSize) -> some View{
        withAnimation(.easeInOut){
            ZStack{
                if !card.isASet{
                    Group{
                        if !card.isSelected{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.blue)
                        }else{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 4)
                                .foregroundColor(Color.red)
                        }
                    }
                    .padding(10)
                    .modifier(addShape(shapeType: card.shapeType, shadingType: card.shadingType, shapeColor: card.color, size: size, noOfShapes: card.noOfShapes))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(gameViewModel: SetGameVM())
    }
}
