//
//  SetModel.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct Model{
    var cardsArray: Array<Card>
    var indexOffirstChosenCard: Int?
    var indexOfsecondChosenCard: Int?
    
    init(cardsArray: Array<Card>){
        self.cardsArray = cardsArray
    }
    
//    func checkIfCardsAreASet(card1: Card, card2: Card, card3: Card) -> Bool{
//        let feat1: Bool = (card1.color == card2.color) == (card1.color == card3.color)
//        let feat2: Bool = (card1.shapeType == card2.shapeType) == (card1.shapeType == card3.shapeType)
//        let feat3: Bool = (card1.noOfShapes == card2.noOfShapes) == (card1.noOfShapes == card3.noOfShapes)
//        let feat4: Bool = (card1.shadingType == card2.shadingType) == (card1.shadingType == card3.shadingType)
//        return (feat1 || feat2 || feat3 || feat4)
//    }
//
//    mutating func chooseCard(card: Card){
//        if let selectedIndex = cardsArray.firstIndex(of: card), !card.isSelected{
//            if let firstIndex = indexOffirstChosenCard{
//                if let secondIndex = indexOfsecondChosenCard{
//                    if checkIfCardsAreASet(card1: card, card2: cardsArray[firstIndex], card3: cardsArray[secondIndex]){
//                        cardsArray[selectedIndex].isASet = true
//                        cardsArray[firstIndex].isASet = true
//                        cardsArray[secondIndex].isASet = true
//                    }
//                }else{
//                    indexOfsecondChosenCard = selectedIndex
//                }
//            }else{
//                indexOffirstChosenCard = selectedIndex
//            }
//        }
//    }
    
    mutating func chooseCard(card: Card){
        if let selectedIndex = cardsArray.firstIndex(of: card){
            if !card.isSelected{
               cardsArray[selectedIndex].isSelected = true
            }else{
                cardsArray[selectedIndex].isSelected = false
            }
        }
    }
    
}

