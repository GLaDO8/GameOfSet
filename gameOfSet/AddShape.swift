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
    
    func body(content: Content) -> some View{
        ZStack{
            Group{
                if (shapeType == .rectangle){
                    RoundedRectangle(cornerRadius: radiusValue)
                        .fill(shapeColor)
                        .opacity(shadingType)
                    RoundedRectangle(cornerRadius: radiusValue)
                        .stroke(lineWidth: strokeWidth)
                }
                else if (shapeType == .oval){
                    Ellipse()
                        .fill(shapeColor)
                        .opacity(shadingType)
                    Ellipse()
                        .stroke(lineWidth: strokeWidth)
                }
                else {
                    RoundedRectangle(cornerRadius: radiusValue)
                        .fill(shapeColor)
                        .opacity(shadingType)
                    RoundedRectangle(cornerRadius: radiusValue)
                        .stroke(lineWidth: strokeWidth)
                }
            }
            .frame(width: (size.width)/CGFloat(noOfShapes+1), height: (size.height)/CGFloat(noOfShapes+1), alignment: .center)
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
