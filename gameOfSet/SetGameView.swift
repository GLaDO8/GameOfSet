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
            Grid(self.gameViewModel.cardsArr ){ card in
                CardView(card: card)
                    .transition(AnyTransition.offset(self.randomLocationGenerator()))
                    .animation(.easeInOut(duration: 0.5))
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            self.gameViewModel.chooseCard(card: card)
                        }
                }
            }.onAppear{
                withAnimation(.easeInOut){
                    self.gameViewModel.newSetGame()
                }
            }
            .padding(10)
            if !self.gameViewModel.isDeckEmpty(){
                Button(action: {
                    self.gameViewModel.DealMoreCards()
                }){
                    Text("Deal More Cards")
                }
            }
        }
    }
    
    // TODO: improve random locations
    func randomLocationGenerator() -> CGSize{
        return CGSize(width: Int.random(in: -1000...1000), height: Int.random(in: -1000...2000))
    }
}

struct CardView: View{
    var card: Model.Card
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    func body(for size: CGSize) -> some View{
        withAnimation(.easeInOut){
            ZStack{
                Group{
                    if !card.isSelected{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.white)
                            .shadow(radius: 3)
                    }else{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color.red)
                    }
                }
                .padding(10)
                .addShape(shapeType: card.shapeType, shadingType: card.shadingType, shapeColor: card.color, size: size, noOfShapes: card.noOfShapes)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(gameViewModel: SetGameVM())
    }
}
