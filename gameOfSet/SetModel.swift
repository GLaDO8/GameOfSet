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
        let feat1 = boolFuncCheck((card1.color == card2.color), (card2.color == card3.color), (card1.color == card3.color))
        let feat2 = boolFuncCheck((card1.shapeType == card2.shapeType), (card2.shapeType == card3.shapeType), (card1.shapeType == card3.shapeType))
        let feat3 = boolFuncCheck((card1.noOfShapes == card2.noOfShapes), (card2.noOfShapes == card3.noOfShapes), (card1.noOfShapes == card3.noOfShapes))
        let feat4 = boolFuncCheck((card1.shadingType == card2.shadingType), (card2.shadingType == card3.shadingType), (card1.shadingType == card3.shadingType))
        printSetDetails(card1: card1, card2: card2, card3: card3, feat1: feat1, feat2:feat2, feat3: feat3, feat4: feat4)
        return (feat1 && feat2 && feat3 && feat4)
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
//                            if let toBeDealt = cardsToBeDealt{
//                                cardsArray.remove(at: selectedIndex)
//                                cardsArray.remove(at: firstIndex)
//                                cardsArray.remove(at: secondIndex)
////                                cardsArray.insert(toBeDealt[0], at: selectedIndex)
////                                cardsArray.insert(toBeDealt[1], at: firstIndex)
////                                cardsArray.insert(toBeDealt[2], at: secondIndex)
//                            }
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
                if indexOfFirstChosenCard != nil{
                    if indexOfSecondChosenCard != nil{
                        indexOfSecondChosenCard = nil
                    }
                    indexOfFirstChosenCard = nil
                }
            }
        }
    }
    
    mutating func dealMoreCards(){
        cardsToBeDealt = Array(completeCardsArray[dealtCardsIndex+1...dealtCardsIndex+3])
    }
    
    //MARK: - helper functions
    func boolFuncCheck(_ a: Bool, _ b: Bool, _ c: Bool) -> Bool{
        return (a && b && c) || (!a && !b && !c)
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
        case oval
        case diamond
        case rectangle
    }
    struct Card: Identifiable{
        var id = UUID()
        var color: Color
        var shapeType: CardShape
        var noOfShapes: Int
        var shadingType: Double
        var isSelected: Bool = false
        var isASet: Bool = false
    }
    
}

