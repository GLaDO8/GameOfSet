//
//  SetViewModel.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

class SetGameVM:ObservableObject{
    //MARK: - Properties
    private static var completeCardSet: Array<Model.Card> = createCompleteSet()
    @Published private(set) var setModel = Model(cardsArray: SetGameVM.pickInitCards(), completeCardsArray: SetGameVM.completeCardSet)
    var cardsArr: Array<Model.Card>{
        setModel.cardsArray
    }
    

    //MARK: - Functions
    static func pickInitCards() -> Array<Model.Card>{
        SetGameVM.completeCardSet.shuffle()
        return Array(SetGameVM.completeCardSet[0..<12])
    }
    static func createCompleteSet() -> Array<Model.Card>{
        var tempArray = Array<Model.Card>()
        let colorArray = [Color.green, Color.blue, Color.pink]
        let shapeArray = [Model.CardShape.diamond, Model.CardShape.squiggle, Model.CardShape.rectangle]
        let noOFShapeArray = [1, 2, 3]
        let shadingArray = [Model.CardFill.empty, Model.CardFill.pattern, Model.CardFill.filled]
        for colorIndex in 0..<colorArray.count{
            for shapeIndex in 0..<shapeArray.count{
                for shadeIndex in 0..<shadingArray.count{
                    for noIndex in 0..<noOFShapeArray.count{
                        tempArray.append(Model.Card(color: colorArray[colorIndex], shapeType: shapeArray[shapeIndex], noOfShapes: noOFShapeArray[noIndex], shadingType: shadingArray[shadeIndex]))
                    }
                }
            }
        }
        return tempArray
    }
    
    //MARK: - Testing
    func printId(card: Model.Card){
        print(card.id)
    }
    
    //MARK: - Access to model details
    func getCards() -> Array<Model.Card>{
        return setModel.cardsArray.filter{ element in
            !element.isASet
        }
    }
    
    //MARK: - Intents
    func chooseCard(card: Model.Card){
        return setModel.chooseCard(card: card)
    }
    
    func newSetGame(){
        self.setModel = Model(cardsArray: SetGameVM.pickInitCards(), completeCardsArray: SetGameVM.completeCardSet)
    }
    
    func isDeckEmpty() -> Bool{
        return setModel.isDeckEmpty()
    }
    func DealMoreCards(){
        
    }

}
