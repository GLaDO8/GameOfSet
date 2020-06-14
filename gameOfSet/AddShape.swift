//
//  AddShape.swift
//  gameOfSet
//
//  Created by shreyas gupta on 13/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct addShape: ViewModifier{
    var shapeType: CardShape
    var shadingType: Double
    var shapeColor: Color
    var size: CGSize
    var noOfShapes: Int
    
    @ViewBuilder
    func body(content: Content) -> some View{
        ZStack{
            Group{
                if shapeType == .rectangle{
                    RoundedRectangle(cornerRadius: radiusValue)
                        .fill(shapeColor)
                    RoundedRectangle(cornerRadius: radiusValue)
                        .stroke(lineWidth: strokeWidth)
                }
                else if shapeType == .oval{
                    Ellipse()
                        .fill(shapeColor)
                    Ellipse()
                        .stroke(lineWidth: strokeWidth)
                }
                else if shapeType == .diamond{
                    RoundedRectangle(cornerRadius: radiusValue)
                        .fill(shapeColor)
                    RoundedRectangle(cornerRadius: radiusValue)
                        .stroke(lineWidth: strokeWidth)
                }
            }
            .frame(width: (size.width)/2, height: (size.height)/2, alignment: .center)
            .opacity(shadingType)
            .foregroundColor(shapeColor)
            content
        }
    }
    let strokeWidth: CGFloat = 2
    let radiusValue: CGFloat = 8
}

//extension View{
//    func addShape(shapeType: CardShape, shadingType: Double, shapeColor: Color, size: CGSize, noOfShapes: Int) -> some View{
//        self.modifier(addShape(shapeType: shapeType, shadingType: shadingType, shapeColor: shapeColor, size: size, noOfShapes: noOfShapes))
//    }
//}
