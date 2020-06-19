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
    private static var completeCardSet: Array<Card> = createCompleteSet()
    private var dealtCardsIndex = 11
    @Published private(set) var setModel = Model(cardsArray: SetGameVM.pickInitCards(), completeCardsArray: SetGameVM.completeCardSet)
    var cardsArr: Array<Card>{
        setModel.cardsArray
    }
    

    //MARK: - Functions
    static func pickInitCards() -> Array<Card>{
        SetGameVM.completeCardSet.shuffle()
        return Array(SetGameVM.completeCardSet[0..<12])
    }
    static func createCompleteSet() -> Array<Card>{
        var tempArray = Array<Card>()
        let colorArray = [Color.green, Color.blue, Color.pink]
        let shapeArray = [CardShape.diamond, CardShape.oval, CardShape.rectangle]
        let noOFShapeArray = [1, 2, 3]
        let shadingArray = [0, 0.2, 1]
        for colorIndex in 0..<colorArray.count{
            for shapeIndex in 0..<shapeArray.count{
                for shadeIndex in 0..<shadingArray.count{
                    for noIndex in 0..<noOFShapeArray.count{
                        tempArray.append(Card(color: colorArray[colorIndex], shapeType: shapeArray[shapeIndex], noOfShapes: noOFShapeArray[noIndex], shadingType: shadingArray[shadeIndex]))
                    }
                }
            }
        }
        return tempArray
    }
    
    //MARK: - Testing
    func printId(card: Card){
        print(card.id)
    }
    
    //MARK: - Access to model details
    func getCards() -> Array<Card>{
        return setModel.cardsArray
    }
    
    //MARK: - Intents
    func chooseCard(card: Card){
        return setModel.chooseCard(card: card)
    }
    
    func newSetGame(){
        self.setModel = Model(cardsArray: SetGameVM.pickInitCards(), completeCardsArray: SetGameVM.completeCardSet)
    }

}
