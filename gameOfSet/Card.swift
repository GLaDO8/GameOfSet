//
//  Card.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

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
