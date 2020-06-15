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
    var indexOfFirstChosenCard: Int?
    var indexOfSecondChosenCard: Int?
    
    init(cardsArray: Array<Card>){
        self.cardsArray = cardsArray
    }
    
    func checkIfCardsAreASet(card1: Card, card2: Card, card3: Card) -> Bool{
        let feat1: Bool = (card1.color == card2.color) && (card2.color == card3.color)
        let feat2: Bool = (card1.shapeType == card2.shapeType) && (card2.shapeType == card3.shapeType)
        let feat3: Bool = (card1.noOfShapes == card2.noOfShapes) && (card2.noOfShapes == card3.noOfShapes)
        let feat4: Bool = (card1.shadingType == card2.shadingType) && (card2.shadingType == card3.shadingType)
        return (feat1 || feat2 || feat3 || feat4)
    }

    mutating func chooseCard(card: Card){
        primary: if let selectedIndex = cardsArray.firstIndex(of: card), !card.isASet{
            if !card.isSelected{
                if let firstIndex = indexOfFirstChosenCard{
                    if let secondIndex = indexOfSecondChosenCard{
                        print(selectedIndex, firstIndex, secondIndex)
                        if checkIfCardsAreASet(card1: card, card2: cardsArray[firstIndex], card3: cardsArray[secondIndex]){
                            cardsArray[selectedIndex].isASet = true
                            cardsArray[firstIndex].isASet = true
                            cardsArray[secondIndex].isASet = true
                        }else{
                            cardsArray[firstIndex].isSelected = false
                            cardsArray[secondIndex].isSelected = false
                            indexOfFirstChosenCard = nil
                            indexOfSecondChosenCard = nil
                            break primary
                        }
                    }else{
                        indexOfSecondChosenCard = selectedIndex
                    }
                }else{
                    indexOfFirstChosenCard = selectedIndex
                }
                cardsArray[selectedIndex].isSelected = true
            }else{
                cardsArray[selectedIndex].isSelected = false
            }
        }
    }
    
}

