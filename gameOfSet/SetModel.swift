//
//  SetModel.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct Model{
    private var completeCardsArray: Array<Card>
    var cardsArray: Array<Card>
    private var cardsToBeDealt: Array<Card>! = Array<Card>(){
        didSet{
            dealtCardsIndex+=3
        }
    }
    private var dealtCardsIndex = 11
    private var indexOfFirstChosenCard: Int?
    private var indexOfSecondChosenCard: Int?
    
    init(cardsArray: Array<Card>, completeCardsArray: Array<Card>){
        self.cardsArray = cardsArray
        self.completeCardsArray = completeCardsArray
    }
    
    func checkIfCardsAreASet(card1: Card, card2: Card, card3: Card) -> Bool{
        return boolFuncCheck(card1.color, card2.color, card3.color)
            && boolFuncCheck(card1.shapeType, card2.shapeType, card3.shapeType)
            && boolFuncCheck(card1.noOfShapes, card2.noOfShapes, card3.noOfShapes)
            && boolFuncCheck(card1.shadingType, card2.shadingType, card3.shadingType)
    }

    mutating func chooseCard(card: Card){
        primary: if let selectedIndex = cardsArray.firstIndex(of: card), !card.isASet{
            //CARD IS SELECTED
            if !card.isSelected{
                if let firstIndex = indexOfFirstChosenCard{
                    if let secondIndex = indexOfSecondChosenCard{
                        if checkIfCardsAreASet(card1: card, card2: cardsArray[firstIndex], card3: cardsArray[secondIndex]){
                            cardsArray[selectedIndex].isASet = true
                            cardsArray[firstIndex].isASet = true
                            cardsArray[secondIndex].isASet = true
                            dealMoreCards()
                            if let toBeDealt = cardsToBeDealt{
                                cardsArray.remove(at: selectedIndex)
                                cardsArray.insert(toBeDealt[0], at: selectedIndex)
                                cardsArray.remove(at: firstIndex)
                                cardsArray.insert(toBeDealt[1], at: firstIndex)
                                cardsArray.remove(at: secondIndex)
                                cardsArray.insert(toBeDealt[2], at: secondIndex)
                            }
                        }else{
                            cardsArray[firstIndex].isSelected = false
                            cardsArray[secondIndex].isSelected = false
                        }
                        indexOfFirstChosenCard = nil
                        indexOfSecondChosenCard = nil
                        break primary
                    }else{
                        indexOfSecondChosenCard = selectedIndex
                    }
                }else{
                    indexOfFirstChosenCard = selectedIndex
                }
                cardsArray[selectedIndex].isSelected = true
            //CARD IS DESELECTED
            }else{
                cardsArray[selectedIndex].isSelected = false
                if selectedIndex == indexOfFirstChosenCard{
                    if indexOfSecondChosenCard != nil{
                        indexOfFirstChosenCard = indexOfSecondChosenCard
                        indexOfSecondChosenCard = nil
                    }
                    indexOfFirstChosenCard = nil
                }else{
                    indexOfFirstChosenCard = nil
                }
            }
        }
    }
    
    mutating func dealMoreCards(){
        cardsToBeDealt = Array(completeCardsArray[dealtCardsIndex+1...dealtCardsIndex+3])
    }
    
    //MARK: - helper functions
    func boolFuncCheck<cardProperty: Equatable>(_ a: cardProperty, _ b: cardProperty, _ c: cardProperty) -> Bool{
        return ((a == b) && (b == c) && (c == a)) || ((a != b) && (b != c) && (c != a))
    }
    
    func isDeckEmpty() -> Bool{
        return (dealtCardsIndex == 80)
    }
    
    func printSetDetails(card1: Card, card2: Card, card3: Card, feat1: Bool, feat2: Bool, feat3: Bool, feat4: Bool){
        print(feat1, feat2, feat3, feat4)
        print("card1 details: \(card1.color), \(card1.shapeType), \(card1.noOfShapes), \(card1.shadingType)")
        print("card2 details: \(card2.color), \(card2.shapeType), \(card2.noOfShapes), \(card2.shadingType)")
        print("card3 details: \(card3.color), \(card3.shapeType), \(card3.noOfShapes), \(card3.shadingType)")
        print()
    }
    
    enum CardShape{
        case squiggle
        case diamond
        case rectangle
    }
    
    enum CardFill{
        case empty
        case pattern
        case filled
    }
    
    struct Card: Identifiable{
        var id = UUID()
        var color: Color
        var shapeType: CardShape
        var noOfShapes: Int
        var shadingType: CardFill
        var isSelected: Bool = false
        var isASet: Bool = false
    }
}

